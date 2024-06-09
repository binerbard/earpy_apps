// import 'package:earpy_app/routes/path.dart';
import 'package:get/get.dart';

class TrackController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void gotoEarpy() {
    // Get.offNamed(Alias.INITIAL);
    Get.back();
  }
}
