import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/category_model.dart';


class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs; 

  @override
  void onInit() {
    fetchCategories(); 
    super.onInit();
  }


  Future<void> fetchCategories() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('categories').get();
      categories.value = snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  
  Future<void> addCategory(String title, String icon) async {
    try {
      var docRef = await FirebaseFirestore.instance.collection('categories').add({
        'title': title,
        'icon': icon,
        'createdAt': FieldValue.serverTimestamp(),
      });

      categories.add(CategoryModel(id: docRef.id, title: title, icon: icon, createdAt: DateTime.now()));
    } catch (e) {
      print("Error adding category: $e");
    }
  }
}
