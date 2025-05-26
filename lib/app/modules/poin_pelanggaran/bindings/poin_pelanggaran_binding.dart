import 'package:get/get.dart';

import '../controllers/poin_pelanggaran_controller.dart';

class PoinPelanggaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoinPelanggaranController>(
      () => PoinPelanggaranController(),
    );
  }
}
