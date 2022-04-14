

class VolunteerBannerModel {
  String? id;
  String? url;
  String? eventUrl;
  bool? status;

  VolunteerBannerModel({this.id, this.url, this.eventUrl, this.status});

  VolunteerBannerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}
