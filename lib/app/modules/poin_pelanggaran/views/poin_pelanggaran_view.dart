import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/poin_pelanggaran_controller.dart';

class PoinPelanggaranView extends GetView<PoinPelanggaranController> {
  const PoinPelanggaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoinPelanggaranView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PoinPelanggaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
