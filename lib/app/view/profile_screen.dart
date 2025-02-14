import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/theme_controller.dart';

import '../../core/style/app_text_style.dart';
import '../../core/style/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    List title = ["Notifications", "General", "Account", "About"];
    List icons = [
      Icon(
        Icons.notifications,
        color: themeController.isDarkMode.value ? whiteClr : blackClr,
      ),
      Icon(Icons.settings,
          color: themeController.isDarkMode.value ? whiteClr : blackClr),
      Icon(Icons.person,
          color: themeController.isDarkMode.value ? whiteClr : blackClr),
      Icon(Icons.error,
          color: themeController.isDarkMode.value ? whiteClr : blackClr)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeController.isDarkMode.value ? blackClr : whiteClr,
        title: Text('Settings',
            style: AppTextStyle.appTextStyle_14_800.copyWith(
                fontSize: 16,
                color: themeController.isDarkMode.value ? whiteClr : blackClr)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGreyClr,
              ),
              child: Icon(Icons.person, size: 15, color: whiteClr),
            ),
            title: Text(
              "Malak Idrissi",
              style: AppTextStyle.appTextStyle_14_800.copyWith(
                  fontSize: 16,
                  color:
                      themeController.isDarkMode.value ? whiteClr : blackClr),
            ),
            subtitle: Text("Rabat, Morocco",
                style: AppTextStyle.appTextStyle_14_800.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: themeController.isDarkMode.value
                        ? whiteClr
                        : blackClr)),
            trailing: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeController.isDarkMode.value ? whiteClr : blackClr,
              ),
              child: Icon(Icons.edit,
                  color:
                      themeController.isDarkMode.value ? blackClr : whiteClr),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Hi! My name is Malak, I'm a community manager \nfrom Rabat,Morocco",
            style: AppTextStyle.appTextStyle_14_800.copyWith(
                fontWeight: FontWeight.w500,
                color: themeController.isDarkMode.value ? whiteClr : blackClr),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    leading: icons[index],
                    title: Text(
                      title[index],
                      style: AppTextStyle.appTextStyle_14_800.copyWith(
                          color: themeController.isDarkMode.value
                              ? whiteClr
                              : blackClr),
                    ));
              },
              itemCount: title.length,
            ),
          )
        ],
      ),
    );
  }
}
