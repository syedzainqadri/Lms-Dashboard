


import 'package:cloud_firestore/cloud_firestore.dart';

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

  List<DonationModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;

      return DonationModel(
          id: dataMap['id'],
          name: dataMap['name'],
          amount: dataMap['amount'],
          city: dataMap['city'],
          project: dataMap['project'],
          transactionID: dataMap['transactionID']
      );
    }).toList();
  }
}
