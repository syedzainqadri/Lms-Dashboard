

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

import '../models/volunteer_model.dart';

class VolunteerController extends GetxController {

  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;



  Future<List<VolunteerModel>?> getVolunteerData() async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("volunteer").get();
    var documents = val.docs;
    List<VolunteerModel> homeTopBannerList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for(int i=0; i<data.length; i++){
          homeTopBannerList.add(VolunteerModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return homeTopBannerList;
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

}