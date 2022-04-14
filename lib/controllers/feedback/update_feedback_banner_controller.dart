

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class UpdateFeedbackBannerController extends GetxController {

  var isUpdatingEvent = false.obs;
  bool get loadingStatus => isUpdatingEvent.value;

  FirebaseFirestore fire = FirebaseFirestore.instance;

  void updateHomeTopBanner(String id, String? eventUrl, String? url, bool? status) async {

    try {
      isUpdatingEvent.value = true;
      await fire.collection('feedbackBanner').doc(id).update({
        'id': id,
        'eventUrl': eventUrl,
        'url': url,
        'status': status,
      });
      isUpdatingEvent.value = false;
      successToast(StringsManager.success, StringsManager.successMsj);
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isUpdatingEvent.value = false;
    }
  }
}