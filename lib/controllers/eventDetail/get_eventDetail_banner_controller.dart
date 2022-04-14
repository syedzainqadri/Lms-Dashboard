

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/models/event_detail_banner_model.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class GetEventDetailBannerController extends GetxController {

  var isLoading = false.obs;
  var isLoadingBanners = false.obs;
  bool get loadingStatus => isLoading.value;


  Future<EventDetailBannerModel?> getHomeTopBannerData(String id) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("eventDetailBanner").doc(id).get();
    var documents = val.data();

    if (documents!.isNotEmpty) {
      try {
        EventDetailBannerModel homeTopBannerData = EventDetailBannerModel.fromFireStore(Map<String, dynamic>.from(documents));
        isLoading.value = false;
        return homeTopBannerData;
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

  Future<List<EventDetailBannerModel>?> getHomeTopBannersData() async {
    isLoadingBanners.value = true;
    var val = await FirebaseFirestore.instance.collection("eventDetailBanner").get();
    var documents = val.docs;
    List<EventDetailBannerModel> homeTopBannerList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for(int i=0; i<data.length; i++){
          homeTopBannerList.add(EventDetailBannerModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoadingBanners.value = false;
        return homeTopBannerList;
      } catch (e) {
        isLoadingBanners.value = false;
        errorToast(StringsManager.error, e.toString());
        return null;
      }
    }
    isLoadingBanners.value = false;
    errorToast(StringsManager.error, StringsManager.noData);
    return null;
  }

}