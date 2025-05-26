import 'package:get/get.dart';

import '../controllers/tatib_controller.dart';

class KlasifikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TatibController>(
      () => TatibController(),
    );
  }
}
