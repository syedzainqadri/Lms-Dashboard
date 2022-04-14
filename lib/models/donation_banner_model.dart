

class DonationBannerModel {
  String? id;
  String? url;
  String? eventUrl;
  bool? status;

  DonationBannerModel({this.id, this.url, this.eventUrl, this.status});

  DonationBannerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}
