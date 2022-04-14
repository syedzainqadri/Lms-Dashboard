import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddHomeTopBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addHomeTopBanner(String? url, String eventUrl, bool? status) async {
    DocumentReference ref = FirebaseFirestore.instance.collection("homeTopBanner").doc();
    await fire.collection('homeTopBanner').doc(ref.id).set({
      'id': ref.id.toString(),
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
