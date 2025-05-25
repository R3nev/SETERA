import 'package:get/get.dart';

import '../controllers/tatib_controller.dart';

class TatibBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TatibController>(
      () => TatibController(),
    );
  }
}
