import 'package:get/get.dart';

class PlanController extends GetxController {
  var trips = <Map<String, String>>[].obs; // List untuk menyimpan trip yang dibuat
  var savedTrips = <Map<String, String>>[].obs; // List untuk menyimpan trip yang disimpan
  var selectedTab = 0.obs;

  void addTrip(String tripName, String imagePath) {
    final newTrip = {"tripName": tripName, "imagePath": imagePath};
    trips.add(newTrip);
    saveTrip(newTrip); // Langsung menyimpan trip ke dalam savedTrips
  }

  void saveTrip(Map<String, String> trip) {
    if (!savedTrips.contains(trip)) {
      savedTrips.add(trip);
    }
  }

  void removeSavedTrip(Map<String, String> trip) {
    savedTrips.remove(trip);
    trips.remove(trip); // Menghapus trip dari daftar trip juga
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }
}