import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/widgets/task_adding_dialog.dart';
import 'package:to_do_machine_task/core/style/app_text_style.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

import 'package:to_do_machine_task/app/controller/task_controller.dart';

import '../controller/theme_controller.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  final TaskController taskController = Get.put(TaskController());
  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    taskController.fetchTasks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeController.isDarkMode.value ? blackClr : whiteClr,
        title: Text(
          "Sport",
          style: AppTextStyle.appTextStyle_14_800.copyWith(
            fontSize: 16,
            color: themeController.isDarkMode.value ? whiteClr : blackClr,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(() {
          if (taskController.tasks.isEmpty) {
            return Center(child: Text("No tasks available"));
          }
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              var task = taskController.tasks[index];
              return taskItem(task['id'], task['title'], task['isCompleted']);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: blackClr,
        child: Icon(Icons.add, color: whiteClr),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TaskAddingDialog(),
          );
        },
      ),
    );
  }

  Widget taskItem(String id, String task, bool isCompleted) {
    final TaskController taskController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => taskController.updateTask(id, !isCompleted),
            child: Icon(
              isCompleted ? Icons.check_circle : Icons.circle_outlined,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
          ),
          SizedBox(width: 10),
          Text(task,
              style: AppTextStyle.appTextStyle_14_800.copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black)),
        ],
      ),
    );
  }
}
