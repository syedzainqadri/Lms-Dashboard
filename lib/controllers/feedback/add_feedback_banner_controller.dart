import 'package:cloud_firestore/cloud_firestore.dart';

class AddFeedbackBanner {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addFeedBackBanner(
      String? url, String eventUrl, bool? status) async {
    await fire.collection('feedbackBanner').doc('HztwggYVu7OjLOgay0bM').update({
      // 'id': ref.id.toString(),
      'url': url,
      'eventUrl': eventUrl,
      'status': status,
    });
  }
}
