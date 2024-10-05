import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skibidiskibidisigma/app/modules/navbar/views/navbar_view.dart';

import '../controllers/plan_controller.dart';

class PlanView extends GetView<PlanController> {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanController controller = Get.put(PlanController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Rencanakan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => controller.selectTab(0),
                  child: Obx(() => Column(
                        children: [
                          Text(
                            "Trip",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedTab.value == 0
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          if (controller.selectedTab.value == 0)
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 2,
                              width: 30,
                              color: Colors.black,
                            )
                        ],
                      )),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => controller.selectTab(1),
                  child: Obx(() => Column(
                        children: [
                          Text(
                            "Simpanan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedTab.value == 1
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          if (controller.selectedTab.value == 1)
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 2,
                              width: 30,
                              color: Colors.black,
                            )
                        ],
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.selectedTab.value == 0) {
                return controller.trips.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 48,
                              color: Colors.orange,
                            ),
                            SizedBox(height: 10),
                            Text('Simpan Tempat yang ingin dikunjungi'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: controller.trips.length,
                        itemBuilder: (context, index) {
                          final trip = controller.trips[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    trip['imagePath']!,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        trip['tripName']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                            title: 'Edit Trip Name',
                                            content: Column(
                                              children: [
                                                TextField(
                                                  controller:
                                                      TextEditingController(),
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Enter new trip name',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                  onChanged: (newName) {
                                                    trip['newTripName'] =
                                                        newName;
                                                  },
                                                ),
                                              ],
                                            ),
                                            textConfirm: 'Save',
                                            textCancel: 'Cancel',
                                            confirmTextColor: Colors.white,
                                            onConfirm: () {
                                              String newTripName = trip[
                                                      'newTripName'] ??
                                                  trip['tripName']!;
                                              controller.updateTripName(
                                                  trip, newTripName);
                                              Get.back(); // Close dialog
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Masuk',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.removeTrip(trip);
                                        },
                                        child: Text(
                                          'Hapus',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              } else {
                return controller.savedTrips.isEmpty
                    ? Center(
                        child: Text('Tidak ada simpanan untuk saat ini'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: controller.savedTrips.length,
                        itemBuilder: (context, index) {
                          final trip = controller.savedTrips[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    trip['imagePath']!,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        trip['tripName']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.removeSavedTrip(trip);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.bottomSheet(
                  BuatTripForm(controller: controller),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  isScrollControlled: true,
                );
              },
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Buat Trip',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuatTripForm extends StatelessWidget {
  final PlanController controller;

  BuatTripForm({required this.controller});

  final TextEditingController tripNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Buat Trip Baru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Nama Trip'),
          SizedBox(height: 10),
          TextField(
            controller: tripNameController,
            decoration: InputDecoration(
              labelText: 'Nama Trip',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                String tripName = tripNameController.text;
                if (tripName.isNotEmpty) {
                  controller.addTrip(tripName, 'assets/icon/bromo.png');
                  Get.back(); // Close the bottom sheet
                } else {
                  Get.snackbar('Error', 'Nama trip tidak boleh kosong',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}