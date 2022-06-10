import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/program_button_model.dart';

class AddProgramController {
  FirebaseFirestore fire = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addProgram(String? name, String? url, String programUrl, String? description,
      bool? status, bool? isFeatured, List<ProgramButtonModel> buttonList, String date) async {
    DocumentReference ref = FirebaseFirestore.instance.collection("program").doc();
    await fire.collection('program').doc(ref.id).set({
      'id': ref.id.toString(),
      'name': name,
      'url': url,
      'programUrl': programUrl,
      'description': description,
      'status': status,
      'isFeatured': isFeatured,
      'programDate': date,
      'buttonList': buttonList.map((e) => e.toMap()).toList()
    });
  }
}
