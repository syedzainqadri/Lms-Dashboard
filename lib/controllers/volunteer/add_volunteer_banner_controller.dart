import 'package:cloud_firestore/cloud_firestore.dart';

class AddVolunteerBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addVolunteerBanner(
      String? url, String eventUrl, bool? status) async {
    await fire
        .collection('volunteerBanner')
        .doc('vUIPVAyAighFb1vw5QSS')
        .update({
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
