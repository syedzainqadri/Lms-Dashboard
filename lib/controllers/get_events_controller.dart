

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/models/event_model.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class GetEventController extends GetxController {

  var isLoading = false.obs;
  var isLoadingEvents = false.obs;
  bool get loadingStatus => isLoading.value;


  Future<EventModel?> getEventData(String id) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("event").doc(id).get();
    var documents = val.data();

    if (documents!.isNotEmpty) {
      try {
        EventModel eventData = EventModel.fromFireStore(Map<String, dynamic>.from(documents));
        isLoading.value = false;
        return eventData;
      } catch (e) {
        isLoading.value = false;
        errorToast(StringsManager.error, e.toString());
        return null;
      }
    }
    isLoading.value = false;
    errorToast(StringsManager.error, StringsManager.noData);
    return null;
  }

  Future<List<EventModel>?> getEventsData() async {
    isLoadingEvents.value = true;
    var val = await FirebaseFirestore.instance.collection("event").get();
    var documents = val.docs;
    List<EventModel> eventList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for(int i=0; i<data.length; i++){
          eventList.add(EventModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoadingEvents.value = false;
        return eventList;
      } catch (e) {
        isLoadingEvents.value = false;
        errorToast(StringsManager.error, e.toString());
        return null;
      }
    }
    isLoadingEvents.value = false;
    errorToast(StringsManager.error, StringsManager.noData);
    return null;
  }

}