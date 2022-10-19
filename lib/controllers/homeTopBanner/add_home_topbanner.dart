import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lmsadminpanle/models/home_top_banner_model.dart';

class AddHomeTopBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;
  final HomeTopBannerModel _homeTopBannerModel = HomeTopBannerModel();

  Future<void> addHomeTopBanner(
      String? url, String eventUrl, bool? status) async {
    DocumentReference ref = FirebaseFirestore.instance
        .collection("homeTopBanner")
        .doc('0xFqRSCeGWfjBxtJzoB1');
    await fire.collection('homeTopBanner').doc('0xFqRSCeGWfjBxtJzoB1').set({
      // 'id': ref.id.toString() ?? _homeTopBannerModel.id,
      'url': url ?? _homeTopBannerModel.url,
      'eventUrl': eventUrl ?? _homeTopBannerModel.eventUrl,
      'status': status ?? _homeTopBannerModel.status,
    });
  }
}
