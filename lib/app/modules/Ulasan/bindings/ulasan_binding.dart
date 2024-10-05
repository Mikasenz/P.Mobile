import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UlasanController>(
 () => UlasanController(),
    );
  }
}
