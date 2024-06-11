import 'package:earpy_app/configs/session.dart';
import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:collection/collection.dart'; // Tambahkan ini untuk firstWhereOrNull

abstract class HistoryProviderAbs {
  Future<void> addHistory(HistoryModel history);
  Future<List<HistoryModel>> getListHistory();
  Future<int> getCountHistory();
  void cacheCount(int total);
  void cacheHistory(List<HistoryModel> history);
  Future<int> getHistoryLength();
  Future<HistoryModel?> findHistoryById(String id);
}

const cacheListHistory = 'CACHE_HISTORY';
const cacheCountHistory = 'CACHE_COUNT_HISTORY';

class HistoryProviderImpl extends SessionStorage implements HistoryProviderAbs {
  @override
  Future<void> addHistory(HistoryModel history) async {
    final data = await getListHistory();
    data.add(history);
    await write(cacheListHistory, data.map((e) => e.toJson()).toList());
    cacheCount(data.length); // Update cache count after adding new history
  }

  @override
  Future<List<HistoryModel>> getListHistory() async {
    final cachedList = await read(cacheListHistory);

    if (cachedList is List<HistoryModel>) {
      return cachedList;
    }
    if (cachedList is List<dynamic>) {
      return cachedList.map((e) => HistoryModel.fromJson(e)).toList();
    } else {
      return <HistoryModel>[];
    }
  }

  @override
  Future<int> getCountHistory() async {
    final count = await read(cacheCountHistory);
    return count ?? 0;
  }

  @override
  void cacheCount(int total) async {
    await write(cacheCountHistory, total);
  }

  @override
  void cacheHistory(List<HistoryModel> history) async {
    final cachedList = await read(cacheListHistory);
    final list = cachedList is List<dynamic>
        ? cachedList.map((e) => HistoryModel.fromJson(e)).toList()
        : [];

    list.addAll(history);
    write(cacheListHistory, list.map((e) => e.toJson()).toList());
    cacheCount(list.length); // Update cache count after caching new history
  }

  @override
  Future<int> getHistoryLength() async {
    final list = await getListHistory();
    return list.length;
  }

  @override
  Future<HistoryModel?> findHistoryById(String id) async {
    final list = await getListHistory();
    return list.firstWhereOrNull((history) => history.id == id);
  }
}
