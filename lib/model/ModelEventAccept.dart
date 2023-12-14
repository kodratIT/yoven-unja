import 'package:cloud_firestore/cloud_firestore.dart';

class ModelEventAccept {
  final int eventId;
  final String ticket;
  final DateTime timeSpent;
  final String userId;

  ModelEventAccept({
    required this.eventId,
    required this.ticket,
    required this.timeSpent,
    required this.userId,
  });

  factory ModelEventAccept.fromJson(Map<String, dynamic> json) {
    return ModelEventAccept(
      eventId: json['event_id'] ?? 0,
      ticket: json['ticket'] ?? '',
      timeSpent: json['timespent'] != null
          ? (json['timespent'] as Timestamp).toDate()
          : DateTime.now(),
      userId: json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'ticket': ticket,
      'timespent': timeSpent,
      'user_id': userId,
    };
  }

  
}
