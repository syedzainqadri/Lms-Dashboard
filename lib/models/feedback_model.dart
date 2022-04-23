




class FeedbackModel {
  String? id;
  String? project;
  String? remarks;
  double? rating;

  FeedbackModel({this.id, this.project, this.remarks, this.rating});

  FeedbackModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    project = doc['project'];
    remarks = doc['remarks'];
    rating = doc['rating'];
  }
}
