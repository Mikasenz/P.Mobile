import 'package:get/get.dart';

class PlanController extends GetxController {
  var trips = <Map<String, String>>[].obs;  // List of trips
  var savedTrips = <Map<String, String>>[].obs;  // List of saved trips
  var selectedTab = 0.obs;

  void addTrip(String tripName, String imagePath) {
    trips.add({
      'tripName': tripName,
      'imagePath': imagePath,
    });
  }

  void saveTrip(Map<String, String> trip) {
    if (!savedTrips.contains(trip)) {
      savedTrips.add(trip);
    }
  }

  void removeSavedTrip(Map<String, String> trip) {
    savedTrips.remove(trip);
  }

  void removeTrip(Map<String, String> trip) {
    trips.remove(trip);
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void updateTripName(Map<String, String> trip, String newTripName) {
    int index = trips.indexOf(trip);
    if (index != -1) {
      trips[index]['tripName'] = newTripName;
      trips.refresh(); // Trigger UI update
    }
  }
}
