import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lmsadminpanle/models/home_bottom_banner_model.dart';

class AddHomeBottomBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  // String id = FirebaseAuth.instance.currentUser!.uid;
  final HomeBottomBannerModel _homeBottomBannerModel = HomeBottomBannerModel();
  String? eventUrlindb;

  Future<void> addHomeBottomBanner(
      String? url, String eventUrl, bool? status) async {
    DocumentReference ref = FirebaseFirestore.instance
        .collection("homeBottomBanner")
        .doc('n2qPrf1upPdndsiHkbZC');
    ref.get().then((value) => eventUrlindb = value.get('eventUrl'));
    print('this is my $eventUrl');
    // print(value.data()));

    await fire
        .collection('homeBottomBanner')
        .doc('n2qPrf1upPdndsiHkbZC')
        .update({
      // 'id': ref.id.toString(),
      'url': url ?? _homeBottomBannerModel.url,
      'eventUrl': eventUrl ?? _homeBottomBannerModel.eventUrl,
      'status': status ?? _homeBottomBannerModel.status,
    });
  }
}
