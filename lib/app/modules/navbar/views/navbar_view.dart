import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.find();

    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Rencanakan'),
            BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Ulasan'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
          ],
          currentIndex: controller.selectedIndex.value, // Observe the selected index
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) => controller.onItemTapped(index), // Handle tap
        ));
  }
}
