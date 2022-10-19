class HomeBottomBannerModel {
  // String? id;
  String? url;
  String? eventUrl;
  bool? status;

  HomeBottomBannerModel(
      {
      // this.id,
      this.url,
      this.eventUrl,
      this.status});

  HomeBottomBannerModel.fromFireStore(Map<String, dynamic> doc) {
    // id = doc['id'];
    url = doc['url'];
    eventUrl = doc['eventUrl'];
    status = doc['status'];
  }
}
