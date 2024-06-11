// import 'package:earpy_app/routes/path.dart';
import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:earpy_app/datasources/repositories/historyrepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:earpy_app/routes/path.dart';
import 'package:get/get.dart';

class JournalController extends GetxController {
  final listHisotries = List<HistoryModel>.empty().obs;
  final lastHistory = Rx<HistoryModel?>(null);
  final countHisotry = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getHistory();
    super.onInit();
  }

  void getHistory() async {
    final responseHisotry = await HistoryRepositoryImpl().listHistories();
    responseHisotry.fold((l) => Alert.notification(message: l), (r) {
      listHisotries.value = r.listHistories.reversed.toList();
      lastHistory.value = listHisotries.first;
      countHisotry.value = r.countHistory;
    });
  }

  void gotoEarpy() {
    Get.back();
    // Get.toNamed(Path.earpy);
  }

  void gotoListHistories() {
    Get.toNamed(Alias.historyList);
  }

  void gotoNotes() {
    Get.toNamed(Alias.note);
  }
}
