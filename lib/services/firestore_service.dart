import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _servicesCollection =
  FirebaseFirestore.instance.collection('services');

  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      QuerySnapshot snapshot = await _servicesCollection.get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Exception('Error fetching services: $e');
    }
  }
}