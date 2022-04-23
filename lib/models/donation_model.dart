


class DonationModel {
  String? id;
  String? name;
  String? amount;
  String? city;
  String? project;
  String? transactionID;

  DonationModel({this.id, this.name, this.amount, this.city, this.project, this.transactionID});

  DonationModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    name = doc['name'];
    amount = doc['amount'];
    city = doc['city'];
    project = doc['project'];
    transactionID = doc['transactionID'];
  }
}
