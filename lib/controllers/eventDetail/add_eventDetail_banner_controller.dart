// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddEventDetailBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addEventDetailsBanner(
      String? url, String eventUrl, bool? status) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection("eventDetailBanner").doc();
    await fire.collection('eventDetailBanner').doc(ref.id).set({
      'id': ref.id.toString(),
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
