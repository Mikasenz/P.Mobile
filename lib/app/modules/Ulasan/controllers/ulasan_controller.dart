import 'package:get/get.dart';

class UlasanController extends GetxController {
  // Observable untuk menyimpan data ulasan
  var reviews = <Map<String, String>>[].obs;

  // Fungsi untuk menambahkan ulasan baru
  void addReview(String title, String imagePath) {
    reviews.add({"title": title, "imagePath": imagePath});
  }

  // Fungsi untuk mendapatkan jumlah ulasan
  int get totalReviews => reviews.length;

  @override
  void onInit() {
    super.onInit();
    // Anda dapat menambahkan data ulasan dummy untuk pengujian
    reviews.addAll([
      {"title": "1 Day - Tour Bromo Sunrise", "imagePath": "assets/bromo.jpg"},
      {"title": "1 Day - Pantai Balekambang", "imagePath": "assets/balekambang.jpg"},
    ]);
  }
}
