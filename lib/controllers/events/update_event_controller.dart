

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class UpdateEventController extends GetxController {

  var isUpdatingEvent = false.obs;
  bool get loadingStatus => isUpdatingEvent.value;

  FirebaseFirestore fire = FirebaseFirestore.instance;

  void updateEvent(String id, String? name, String? eventUrl, String? url, String? description, bool? tarana, bool? poster,
      bool? sponsors, bool? program, bool? resource_Persons,
      bool? gallery, bool? media, bool? getInvolved, bool? testimonials,
      bool? venue, bool? registration, bool? videos, bool? book_launches, bool? status) async {

    try {
      isUpdatingEvent.value = true;
      print(id);
      await fire.collection('event').doc(id).update({
        'id': id,
        'name': name,
        'eventUrl': eventUrl,
        'url': url,
        'description': description,
        'tarana': tarana,
        'poster': poster,
        'sponsors': sponsors,
        'program': program,
        'resource_person': resource_Persons,
        'gallery': gallery,
        'media': media,
        'getInvolved': getInvolved,
        'testimonials': testimonials,
        'venue': venue,
        'registration': registration,
        'video': videos,
        'book_launches': book_launches,
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