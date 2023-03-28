import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import '../constants/color_constants.dart';
import '../controller/setting_screen_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingScreenController());
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
        title: const Text('設定'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SettingsList(
              lightTheme: SettingsThemeData(
                settingsListBackground: ColorConstant.settingsListBackground,
                settingsSectionBackground:
                    ColorConstant.settingsSectionBackground,
              ),
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.star,
                        color: ColorConstant.yellow,
                      ),
                      title: const Text('レビューを書く'),
                      onPressed: (context) => controller.onTapReview(),
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.mail,
                        color: ColorConstant.lightBlue,
                      ),
                      title: const Text('お問い合わせ'),
                      onPressed: (context) => controller.onTapMail(),
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        AntDesign.twitter,
                        color: ColorConstant.blue,
                      ),
                      title: const Text('開発者'),
                      onPressed: (context) => controller.onTapTwitter(),
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.local_police,
                        color: ColorConstant.grey,
                      ),
                      title: const Text('ライセンス'),
                      onPressed: (context) => controller.onTapLicense(),
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        MaterialCommunityIcons.github,
                        color: ColorConstant.black,
                      ),
                      title: const Text('Github'),
                      onPressed: (context) => controller.onTapGithub(),
                    ),
                    SettingsTile.navigation(
                      title: const Text('バージョン'),
                      trailing: Obx(
                        () => Text(controller.version.value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
