




class VolunteerModel {
  String? id;
  String? name;
  String? email;
  String? city;
  String? phoneNo;
  String? project;

  VolunteerModel({this.id, this.name, this.email, this.city, this.phoneNo, this.project});

  VolunteerModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    city = doc['city'];
    phoneNo = doc['phoneNo'];
    project = doc['project'];
  }
}
