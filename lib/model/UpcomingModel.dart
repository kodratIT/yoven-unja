import 'package:cloud_firestore/cloud_firestore.dart';

class UpcommingModel {
  final int id;
  final String capacity;
  final String dateEvent;
  final String description;
  final String images;
  final String location;
  final String locationDetail;
  final String name;
  final String timeEvent;

  UpcommingModel({
    required this.id,
    required this.capacity,
    required this.dateEvent,
    required this.description,
    required this.images,
    required this.location,
    required this.locationDetail,
    required this.name,
    required this.timeEvent,
  });

  factory UpcommingModel.fromJson(Map<String, dynamic> json) {
    return UpcommingModel(
      id: json['id'] ?? '',
      capacity: json['capacity'] ?? '0',
      dateEvent: (json['date_event'])??'',
      description: json['description'] ?? '',
      images: json['images'] ?? '',
      location: json['location'] ?? '',
      locationDetail: json['location_detail'] ?? '',
      name: json['name'] ?? '',
      timeEvent: json['time_event'] ?? '',
    );
  }
}
