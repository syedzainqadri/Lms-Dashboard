import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/helpers/firebase_helper.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isFLoading = false.obs;
  var isRLoading = false.obs;
  UserCredential? _userCredential;
  User? user;

  bool get loadingStatus => isLoading.value;
  bool get loadingFStatus => isFLoading.value;
  bool get loadingRStatus => isRLoading.value;

  void register(String name, String email, String password) async {
    try {
      isRLoading.value = true;
      _userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      addAuthData(name, email);
      isRLoading.value = false;
      Get.toNamed('/');
      successToast(StringsManager.success, StringsManager.successMsj);
    } on FirebaseAuthException catch (e) {
      errorToast(StringsManager.error, e.message!);
      isRLoading.value = false;
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isRLoading.value = false;
    }
  }

  void login(String email, String password) async {
    final box = GetStorage();
    try {
      isLoading.value = true;
      _userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      box.write("userId", _userCredential!.user!.uid);
      isLoading.value = false;
      Get.toNamed('/root');
      successToast(StringsManager.success, StringsManager.successMsj);
    } on FirebaseAuthException catch (e) {
      errorToast(StringsManager.error, e.message!);
      isLoading.value = false;
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isLoading.value = false;
    }
  }

  void sendResetMail(String email) async {
    isFLoading.value = true;
    try {
      await auth.sendPasswordResetEmail(email: email);
      successToast(StringsManager.success, StringsManager.successEmail);
      Get.toNamed('/');
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
      isFLoading.value = false;
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      errorToast(StringsManager.error, e.toString());
    }
  }

  void addAuthData(String name, String email) async {
    user = _userCredential!.user;
    await FirebaseFirestore.instance
        .collection('adminAuthData')
        .doc(user!.uid)
        .set({
      "id": user!.uid,
      "name": name,
      "email": email,
    });
  }
}
