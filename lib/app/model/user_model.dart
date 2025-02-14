class UserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  final int status;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
    required this.status,
  });


  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      createdAt: DateTime.parse(map['createdAt']),
      status: map['status'],
    );
  }
}
