

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/models/event_model.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class GetEventController extends GetxController {

  var isLoading = false.obs;
  var isLoadingEvents = false.obs;
  String? id;
  bool get loadingStatus => isLoading.value;


  Future<EventModel?> getEventData() async {
    isLoading.value = true;
    id = FirebaseAuth.instance.currentUser!.uid;
    var documents;
    DocumentReference ref = FirebaseFirestore.instance.collection("event").doc();
    var val = FirebaseFirestore.instance.collection("event").get().then((value) {
      for (var element in value.docs) {
        documents = element.data();
        
      }
    });
    print(documents);
    // var values = FirebaseFirestore.instance.collection("event").where(val == ref.id).limit(1).get().then((value) {
    //   for (var element in value.docs) {
    //
    //       print(documents);
    //   }
    // });


    if (documents!.isNotEmpty) {
      try {
        EventModel eventData = EventModel.fromFireStore(Map<String, dynamic>.from(documents));
        isLoading.value = false;
        // successToast(StringsManager.success, "Data Fetched");
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
    id = FirebaseAuth.instance.currentUser!.uid;
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
        print(eventList);
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