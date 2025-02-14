import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var tasks = <Map<String, dynamic>>[].obs; 


  void fetchTasks() {
    _firestore.collection('tasks').snapshots().listen((snapshot) {
      tasks.value = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'isCompleted': doc['isCompleted'],
        };
      }).toList();
    });
  }

  Future<void> addTask(String title) async {
    await _firestore.collection('tasks').add({
      'title': title,
      'isCompleted': false,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateTask(String taskId, bool isCompleted) async {
    await _firestore.collection('tasks').doc(taskId).update({
      'isCompleted': isCompleted,
    });
  }
}
