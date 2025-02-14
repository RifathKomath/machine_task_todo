import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/theme_controller.dart';
import 'package:to_do_machine_task/app/view/profile_screen.dart';
import 'package:to_do_machine_task/app/view/task_screen.dart';
import 'package:to_do_machine_task/app/widgets/dialog.dart';
import 'package:to_do_machine_task/core/style/app_text_style.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

import '../controller/category_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      bool isDarkMode = themeController.isDarkMode.value;
      Color backgroundColor = isDarkMode ? Colors.black : Colors.white;
      Color textColor = isDarkMode ? Colors.white : Colors.black;
      Color iconBgColor = isDarkMode ? Colors.grey[800]! : Colors.grey[300]!;
      Color boxShadowColor =
          isDarkMode ? Colors.grey[700]! : Colors.grey.withOpacity(0.3);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Categories',
            style: AppTextStyle.appTextStyle_14_800.copyWith(
              fontSize: 16,
              color: textColor,
            ),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBgColor,
                ),
                child: Icon(Icons.person, size: 15, color: textColor),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: textColor,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: boxShadowColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconBgColor,
                        ),
                        child: Icon(Icons.person, size: 15, color: textColor),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"The memories is a shield and life helper".',
                              style: AppTextStyle.appTextStyle_14_800.copyWith(
                                fontStyle: FontStyle.italic,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Tamim Al-Barghouti",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (categoryController.categories.isEmpty) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => TitleDialog(
                              onSubmit: (String title, String icon) async {
                                if (title.isNotEmpty && icon.isNotEmpty) {
                                  await categoryController.addCategory(
                                      title, icon);
                                  Get.back();
                                } else {
                                  Get.snackbar("Error",
                                      "Title and Icon cannot be empty");
                                }
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: textColor,
                          ),
                          child:
                              Icon(Icons.add, size: 50, color: backgroundColor),
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: categoryController.categories.isEmpty
                        ? 1
                        : categoryController.categories.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => TitleDialog(
                                onSubmit: (String title, String icon) async {
                                  if (title.isNotEmpty && icon.isNotEmpty) {
                                    await categoryController.addCategory(
                                        title, icon);
                                    Get.back();
                                  } else {
                                    Get.snackbar("Error",
                                        "Title and Icon cannot be empty");
                                  }
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: boxShadowColor,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: textColor,
                                ),
                                child: Icon(Icons.add,
                                    size: 33, color: backgroundColor),
                              ),
                            ),
                          ),
                        );
                      } else {
                        var category = categoryController.categories[index - 1];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => TaskScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: boxShadowColor,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        category.icon,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        category.title,
                                        style: AppTextStyle.appTextStyle_14_800
                                            .copyWith(
                                          color: textColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text('0 task',
                                          style: AppTextStyle
                                              .appTextStyle_14_800
                                              .copyWith(
                                            color: lightGreyClr,
                                          )),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.more_vert_outlined,
                                    color: iconBgColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
