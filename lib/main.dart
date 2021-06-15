import 'package:criptest/controllers/charactercontroller.dart';
import 'package:criptest/service/data_service.dart';
import 'package:criptest/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: AppBinding(),
    );
  }
}


class AppBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DataService>(() => DataService());
    Get.lazyPut(
            () => CharactersController(
                dataService: Get.find<DataService>())
            );
  }
}
