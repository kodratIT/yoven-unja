import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final int mobilePhone;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.mobilePhone,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      mobilePhone: json['mobile_phone'] ?? '',
      createdAt: json['created_at'] != null
          ? (json['created_at'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile_phone': mobilePhone,
      'created_at': createdAt,
    };
  }
}
