import 'package:get/get.dart';

class CariController extends GetxController {
  var isLocationActive = false.obs;

  void toggleLocation() {
    isLocationActive.value = !isLocationActive.value;
  }
}
