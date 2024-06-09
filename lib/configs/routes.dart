import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PathRoutes {
  static GetPage create(
      {required String alias,
      required Widget Function() view,
      required Bindings bindings}) {
    return GetPage(name: alias, page: view, binding: bindings);
  }
}
