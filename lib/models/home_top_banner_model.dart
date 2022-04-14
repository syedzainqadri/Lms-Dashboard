

class HomeTopBannerModel {
  String? id;
  String? url;
  String? eventUrl;
  bool? status;

  HomeTopBannerModel({this.id, this.url, this.eventUrl, this.status});

  HomeTopBannerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}
