import 'package:flutter/material.dart';
import 'package:earpy_app/presentations/main.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';

void main() async {
  runApp(const AppEarpy());
}

class AppEarpy extends StatefulWidget {
  const AppEarpy({super.key});

  @override
  State<AppEarpy> createState() => _AppEarpyState();
}

class _AppEarpyState extends State<AppEarpy> {
  @override
  Widget build(BuildContext context) {
    return const InitialApp();
  }
}
