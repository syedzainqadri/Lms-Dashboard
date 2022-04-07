import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addEvent(
    String? name, String? url, bool? tarana, bool? poster,
    bool? sponsors, bool? program, bool? resource_Persons,
    bool? gallery, bool? media, bool? getInvolved, bool? testimonials,
    bool? venue, bool? registration, bool? videos, bool? book_launches, bool? status
  ) async {
    DocumentReference ref = FirebaseFirestore.instance.collection("event").doc();
    await fire.collection('event').doc(ref.id).set({
      'id': ref.id.toString(),
      'name': name,
      'url': url,
      'tarana': tarana,
      'poster': poster,
      'sponsors': sponsors,
      'program': program,
      'resource_person': resource_Persons,
      'gallery': gallery,
      'media': media,
      'getInvolved': getInvolved,
      'testimonials': testimonials,
      'venue': venue,
      'registration': registration,
      'video': videos,
      'book_launches': book_launches,
      'status': status,
    });
  }
}
