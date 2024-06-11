import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:earpy_app/datasources/repositories/historyrepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:get/get.dart';

class HistoryListController extends GetxController {
  final listHistories = List<HistoryModel>.empty().obs;
  final lastHistory = Rx<HistoryModel?>(null);
  final countHistories = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _getListHistories();
    super.onInit();
  }

  void _getListHistories() async {
    final response = await HistoryRepositoryImpl().listHistories();
    response.fold((l) => Alert.error(message: l), (r) {
      listHistories.value = r.listHistories.reversed.toList();
      lastHistory.value = listHistories.first;
      countHistories.value = r.countHistory;
    });
  }

  void gotoDailyJournal() {
    Get.back();
    // Get.toNamed(Path.earpy);
  }
}
