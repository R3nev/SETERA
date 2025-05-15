import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/widgets/splash.dart';
void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds:5)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }else {
          return GetMaterialApp(
            title: "Application",
            initialRoute: Routes. login,
            getPages: AppPages.routes,
          );
        }
      },
    );
  }
}