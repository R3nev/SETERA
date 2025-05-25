import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tatib_controller.dart';

class TatibView extends GetView<TatibController> {
  const TatibView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TatibView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TatibView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
