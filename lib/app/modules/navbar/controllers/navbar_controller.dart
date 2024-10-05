import 'package:get/get.dart';
import 'package:skibidiskibidisigma/app/routes/app_pages.dart';

class NavbarController extends GetxController {
  // Track the selected index for the BottomNavigationBar
  var selectedIndex = 0.obs;

  // List of available routes based on the index
  final List<String> routes = [
    Routes.HOME,
    Routes.CARI,  
    Routes.PLAN,
    Routes.ULASAN,
    Routes.AKUN,
    // 0
  ];

  // Function to handle navigation based on index
  void onItemTapped(int index) {
    selectedIndex.value = index;
    Get.toNamed(routes[index]);
  }
}