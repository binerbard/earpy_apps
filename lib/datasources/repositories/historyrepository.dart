import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:earpy_app/datasources/models/response/hisotryresmodel.dart';
import 'package:earpy_app/datasources/providers/historyprovider.dart';

abstract class HistoryRepositoryAbs {
  Future<Either<String, HistoryModel>> addHistory(HistoryModel hisotry);
  Future<Either<String, HistoryResModel>> listHistories();
}

class HistoryRepositoryImpl implements HistoryRepositoryAbs {
  final local = HistoryProviderImpl();
  late Either<String, HistoryModel> response;

  @override
  Future<Either<String, HistoryModel>> addHistory(HistoryModel history) async {
    // TODO: implement addHistory
    try {
      await local.addHistory(history);
      return Right(history);
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }

  @override
  Future<Either<String, HistoryResModel>> listHistories() async {
    // TODO: implement listHistories
    try {
      final listHisotries = await local.getListHistory();
      final countHistory = await local.getCountHistory();
      if (listHisotries.isNotEmpty) {
        final historiesData = HistoryResModel(
            listHistories: listHisotries, countHistory: countHistory);

        return Right(historiesData);
      }
      return const Left("Data Tidak Tersedia");
    } catch (e) {
      return const Left("Terjadi Kesalahan Pada Data");
    }
  }
}
