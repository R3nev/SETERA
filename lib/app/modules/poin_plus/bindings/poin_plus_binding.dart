import 'package:get/get.dart';

import '../controllers/poin_plus_controller.dart';

class PoinPlusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoinPlusController>(
      () => PoinPlusController(),
    );
  }
}
