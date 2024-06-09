import 'package:earpy_app/datasources/models/historymodel.dart';
import 'package:dartz/dartz.dart';
import 'package:earpy_app/datasources/providers/historyprovider.dart';

class HisotryRepositoryImpl {
  final local = HistoryProviderImpl();
  late Either<String, HistoryModel> response;

  Future<Either<String, HistoryModel>> repoHistory() async {
    List<HistoryModel> listData = [];
    int reminingData = 0;
    try {
      
      local.cacheCount(total)
    } catch (e) {}
  }
}
