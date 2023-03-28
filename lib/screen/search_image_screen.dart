import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../controller/search_image_screen_controller.dart';
import 'component/no_screen.dart';

class SearchImageScreen extends StatelessWidget {
  const SearchImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchImageScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search images',
              ),
              onChanged: controller.inputText,
            ),
          ),
          Obx(
            () => Expanded(
              child: controller.images.isNotEmpty
                  ? controller.isHit.value
                      ? GridView.builder(
                          itemCount: controller.images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) {
                            final image = controller.images[index];
                            return GestureDetector(
                              onTap: () {
                                final result = image['largeImageURL'];
                                Navigator.pop(context, result);
                              },
                              child: CachedNetworkImage(
                                imageUrl: image['webformatURL'],
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            );
                          },
                        )
                      : const NoScreen()
                  : const EmptyScreen(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => controller.searchImages(controller.searchText.value),
        onPressed: () {
          controller.searchImages();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
