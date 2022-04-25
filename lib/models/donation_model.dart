


import 'package:flutter/material.dart';

import '../views/root/subPages/donations/dummy.dart';

class DonationModel {
  String? id;
  String? name;
  String? amount;
  String? city;
  String? project;
  String? transactionID;

  DonationModel({this.id, this.name, this.amount, this.city, this.project, this.transactionID});

  DataRow getRow(SelectedCallBack callback, List<String> selectedIds) {
    return DataRow(
      cells: [
        DataCell(Text(name!)),
        DataCell(Text(project!)),
        DataCell(Text(city!)),
        DataCell(Text(amount!)),
        DataCell(Text(transactionID!)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  DonationModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    name = doc['name'];
    amount = doc['amount'];
    city = doc['city'];
    project = doc['project'];
    transactionID = doc['transactionID'];
  }
}
