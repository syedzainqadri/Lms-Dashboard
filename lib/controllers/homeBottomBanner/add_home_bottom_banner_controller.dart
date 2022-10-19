// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddHomeBottomBanner extends GetxController {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  // String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addHomeBottomBanner(
      String? url, String? eventUrl, bool? status) async {
    await fire
        .collection('homeBottomBanner')
        .doc('n2qPrf1upPdndsiHkbZC')
        .update({
      // 'id': ref.id.toString(),
      // ignore: prefer_if_null_operators
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
