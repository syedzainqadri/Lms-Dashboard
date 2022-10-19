import 'package:cloud_firestore/cloud_firestore.dart';

class AddDonationBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  // String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addDonationBanner(
      String? url, String eventUrl, bool? status) async {
    fire.collection('donationBanner').doc('I7liecL7nHST4cBzgjjN').update({
      // 'id': ref.id.toString(),
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
