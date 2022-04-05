import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addEvent(
    String? name,
    String? url,
    // bool? tarana,
    // bool? poster,
    // bool? sponsors,
    // bool? program,
    // bool? resource_Persons,
    // bool? gallery,
    // bool? media,
    // bool? getInvolved,
    // bool? testimonials,
    // bool? venue,
    // bool? registration,
    // bool? videos,
    // bool? book_launches,
    // bool? status
  ) async {
    await fire.collection('event').doc('uid').set({
      'name': name,
      'url': url,
      // 'tarana': tarana,
      // 'poster': poster,
      // 'sponsors': sponsors,
      // 'program': program,
      // 'resource_person': resource_Persons,
      // 'gallery': gallery,
      // 'media': media,
      // 'getInvolved': getInvolved,
      // 'testimonials': testimonials,
      // 'venue': venue,
      // 'registration': registration,
      // 'video': videos,
      // 'book_launches': book_launches,
      // 'status': status,
    });
  }
}
