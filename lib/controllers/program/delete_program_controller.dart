

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class DeleteProgramController extends GetxController {

  var isUpdatingProgram = false.obs;
  bool get loadingStatus => isUpdatingProgram.value;


  void deleteProgram(String id) async {
    try {
      isUpdatingProgram.value = true;
      await FirebaseFirestore.instance.collection('program').doc(id).delete();
      isUpdatingProgram.value = false;
      successToast(StringsManager.success, StringsManager.successMsj);
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isUpdatingProgram.value = false;
    }
  }
}