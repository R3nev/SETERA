import 'package:get/get.dart';

import '../controllers/poin_tambahana_controller.dart';

class PoinTambahanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoinTambahanaController>(
      () => PoinTambahanaController(),
    );
  }
}
