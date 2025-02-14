import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String icon;
  final String title;

  final DateTime? createdAt;

  CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    this.createdAt,
  });

  factory CategoryModel.fromMap(String id, Map<String, dynamic> map) {
    return CategoryModel(
      id: id,
      title: map['title'] ?? '',
      icon: map['icon'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'createdAt': createdAt ?? DateTime.now(),
    };
  }
}
