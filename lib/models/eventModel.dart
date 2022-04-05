import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? name;
  String? url;
  // bool? tarana;
  // bool? poster;
  // bool? sponsors;
  // bool? program;
  // bool? resource_Persons;
  // bool? gallery;
  // bool? media;
  // bool? getInvolved;
  // bool? testimonials;
  // bool? venue;
  // bool? registration;
  // bool? videos;
  // bool? book_launches;
  // bool? status;

  EventModel({
    this.name,
    this.url,
    // this.tarana,
    // this.poster,
    // this.sponsors,
    // this.program,
    // this.resource_Persons,
    // this.gallery,
    // this.media,
    // this.getInvolved,
    // this.testimonials,
    // this.venue,
    // this.registration,
    // this.videos,
    // this.book_launches,
    // this.status,
  });

  EventModel.fromFireStore(DocumentSnapshot doc) {
    name = doc['name'];
    url = doc['url'];
    // tarana = doc['tarana'];
    // poster = doc['poster'];
    // sponsors = doc['sponsors'];
    // program = doc['program'];
    // resource_Persons = doc['resource_Persons'];
    // gallery = doc['gallery'];
    // media = doc['media'];
    // getInvolved = doc['getInvolved'];
    // testimonials = doc['testimonials'];
    // venue = doc['venue'];
    // registration = doc['registration'];
    // videos = doc['videos'];
    // book_launches = doc['book_launches'];
    // status = doc['status'];
  }
}
