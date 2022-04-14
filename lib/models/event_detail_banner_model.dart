

class EventDetailBannerModel {
  String? id;
  String? url;
  String? eventUrl;
  bool? status;

  EventDetailBannerModel({this.id, this.url, this.eventUrl, this.status});

  EventDetailBannerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}
