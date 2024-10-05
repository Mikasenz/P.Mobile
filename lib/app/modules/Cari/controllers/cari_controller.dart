import 'package:get/get.dart';

class CariController extends GetxController {
  // Reactive variable to track location activation state
  var isLocationActive = false.obs;

  get onItemTapped => null;

  get selectedIndex => null;

  get addPlace => null;

  // Toggle function to switch location on and off
  void toggleLocation() {
    // This toggles the value between true and false
    isLocationActive.value = !isLocationActive.value;
    
    // Add additional logic here if needed, e.g., checking for permissions
  }
}
