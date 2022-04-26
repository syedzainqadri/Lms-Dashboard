
import 'package:get/get.dart';

class TitleController extends GetxController {
  var title = "Events List".obs;

  changeName(String value) {
    title(value).obs;
  }

}