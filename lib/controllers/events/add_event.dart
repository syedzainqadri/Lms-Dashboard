import 'package:cloud_firestore/cloud_firestore.dart';

class AddEvent {
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<void> addEvent(
    String? name, String? url, String eventUrl, String? description, bool? tarana, bool? poster,
    bool? sponsors, bool? program, bool? resource_Persons,
    bool? gallery, bool? media, bool? getInvolved, bool? testimonials,
    bool? venue, bool? registration, bool? videos, bool? book_launches, bool? status, String date
  ) async {
    DocumentReference ref = FirebaseFirestore.instance.collection("event").doc();
    await fire.collection('event').doc(ref.id).set({
      'id': ref.id.toString(),
      'name': name,
      'url': url,
      'eventUrl': eventUrl,
      'description': description,
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
      'eventDate': date,
    });
  }
}
