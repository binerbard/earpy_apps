import 'package:earpy_app/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../routes/main.dart';

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Earpy Application",
      getPages: RoutesInit.ROUTES,
      initialRoute: Alias.initial,
    );
  }
}
