// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEventDetailBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addEventDetailsBanner(
      String? url, String eventUrl, bool? status) async {
    await fire
        .collection('eventDetailBanner')
        .doc('Hy9zKXWt1JkAWKdrtE5B')
        .update({
      // 'id': ref.id.toString(),
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
