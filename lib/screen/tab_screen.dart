import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:solid_todo_app/screen/mens_site_screen.dart';
import '../constants/color_constants.dart';
import '../controller/tab_screen_controller.dart';
import 'setting_screen.dart';
import 'todo_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabScreenController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: [
          const TodoScreen(),
          const MensSiteScreen(),
          const SettingScreen(),
        ][controller.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: ColorConstant.appBarColor,
            unselectedItemColor: Colors.grey,
            iconSize: 30,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.today_outlined),
                label: 'Todo',
              ),
              BottomNavigationBarItem(
                icon: Icon(AntDesign.earth),
                label: 'Web Site',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
