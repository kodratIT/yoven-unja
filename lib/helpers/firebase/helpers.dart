import 'package:cloud_firestore/cloud_firestore.dart';

class EventHelper {
  static Future<int> getNextEventId() async {
    try {
      final DocumentReference counterDoc = FirebaseFirestore.instance.collection('counters').doc('eventCounter');
      final DocumentSnapshot counterSnapshot = await counterDoc.get();

      int currentCount = counterSnapshot.exists ? counterSnapshot['count'] : 0;

      // Increment the counter and update it in Firestore
      await counterDoc.set({'count': currentCount + 1});

      return currentCount + 1;
    } catch (e) {
      print('Error getting next event ID: $e');
      return 0; // Or any other value that fits your needs
    }
  }
}
