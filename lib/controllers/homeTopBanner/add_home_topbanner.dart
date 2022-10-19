import 'package:cloud_firestore/cloud_firestore.dart';

class AddHomeTopBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addHomeTopBanner(
      String? url, String eventUrl, bool? status) async {
    await fire.collection('homeTopBanner').doc('0xFqRSCeGWfjBxtJzoB1').set({
      // 'id': ref.id.toString() ?? _homeTopBannerModel.id,
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
