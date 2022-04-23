

class FeedbackBannerModel {
  String? id;
  String? url;
  String? eventUrl;
  bool? status;

  FeedbackBannerModel({this.id, this.url, this.eventUrl, this.status});

  FeedbackBannerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}