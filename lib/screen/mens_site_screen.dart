import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_constants.dart';

class MensSiteScreen extends StatefulWidget {
  const MensSiteScreen({Key? key}) : super(key: key);

  @override
  State<MensSiteScreen> createState() => _MensSiteScreenState();
}

class _MensSiteScreenState extends State<MensSiteScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InAppWebView(
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://www.google.com/search?q=%E5%9E%A2%E6%8A%9C%E3%81%91+%E3%83%A1%E3%83%B3%E3%82%BA+&rlz=1C5CHFA_enJP1030JP1030&sxsrf=APwXEdeKO-jOG5EEKggUQyIjIHYeXbJvTQ%3A1679985829364&ei=pYwiZLX5FYnbhwOE6bn4BQ&ved=0ahUKEwj139j0gv79AhWJ7WEKHYR0Dl8Q4dUDCA8&uact=5&oq=%E5%9E%A2%E6%8A%9C%E3%81%91+%E3%83%A1%E3%83%B3%E3%82%BA+&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIECCMQJzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEOgoIABBHENYEELADOgYIABAIEB5KBAhBGABQqRdYrxtggx9oAXABeACAAWKIAZ8CkgEBM5gBAKABAcgBCsABAQ&sclient=gws-wiz-serp"),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
            ),
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;
              if ((uri.scheme == 'test') && (uri.host == "youtube")) {
                await launchUrl(Uri.parse('https://www.youtube.com'),
                    mode: LaunchMode.externalApplication);
                return NavigationActionPolicy.CANCEL;
              }
              return NavigationActionPolicy.ALLOW;
            },
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    webViewController?.goBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                IconButton(
                  onPressed: () {
                    webViewController?.goForward();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
