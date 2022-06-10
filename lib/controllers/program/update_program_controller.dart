

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/models/program_button_model.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class UpdateProgramController extends GetxController {

  var isUpdatingProgram = false.obs;
  bool get loadingStatus => isUpdatingProgram.value;

  FirebaseFirestore fire = FirebaseFirestore.instance;

  void updateProgram(String id, String? name, String? url, String programUrl, String? description,  bool? status, bool? isFeatured, List<ProgramButtonModel> buttonList, String date) async {

    try {
      isUpdatingProgram.value = true;
      await fire.collection('program').doc(id).update({
        'id': id,
        'name': name,
        'url': url,
        'programUrl': programUrl,
        'description': description,
        'status': status,
        'programDate': date,
        'isFeatured': isFeatured,
        'buttonList': buttonList.map((e) => e.toMap()).toList()
      });
      isUpdatingProgram.value = false;
      successToast(StringsManager.success, StringsManager.successMsj);
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isUpdatingProgram.value = false;
    }
  }
}