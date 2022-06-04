

class ProgramButtonModel {

  String? buttonName;
  String? buttonUrl;

  ProgramButtonModel({this.buttonName, this.buttonUrl});

  Map toMap() {
    return {
      'buttonName': buttonName,
      'buttonUrl': buttonUrl,
    };
  }

  ProgramButtonModel.fromFireStore(Map<String, dynamic> doc) {
    buttonName = doc['buttonName'];
    buttonUrl = doc['buttonUrl'];
  }
}