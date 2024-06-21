import 'package:earpy_app/configs/session.dart';
import 'package:earpy_app/datasources/models/response/moodresmodel.dart';
import 'package:get/get.dart';

abstract class MoodTrackProviderAbs {
  Future<MoodTrackResModel?> getMoodTrackByMonthAndYear(int year, int month);
  Future<List<MoodTrackResModel>> getListMoodTrack();
  Future<void> storeMoodTrack(MoodTrackResModel req);
  Future<void> updateMoodTrack(int year, int month, MoodTrackResModel req);
  Future<void> addMoodTrack(MoodTrackResModel req);
}

const cacheListMoodTrack = 'CACHE_MOOD_TRACK';

class MoodTrackProviderImpl extends SessionStorage
    implements MoodTrackProviderAbs {
  @override
  Future<MoodTrackResModel?> getMoodTrackByMonthAndYear(
      int year, int month) async {
    final moodTracks = await getListMoodTrack();

    final matchingMoodTrack = moodTracks.firstWhereOrNull(
      (moodTrack) => moodTrack.year == year && moodTrack.month == month,
    );

    return matchingMoodTrack;
  }

  @override
  Future<List<MoodTrackResModel>> getListMoodTrack() async {
    final cachedList = await read(cacheListMoodTrack);

    if (cachedList is List<MoodTrackResModel>) {
      return cachedList;
    }
    if (cachedList is List<dynamic>) {
      return cachedList.map((e) => MoodTrackResModel.fromJson(e)).toList();
    } else {
      return <MoodTrackResModel>[];
    }
  }

  @override
  Future<void> storeMoodTrack(MoodTrackResModel req) async {
    final checkMoodTrack =
        await getMoodTrackByMonthAndYear(req.year, req.month);

    if (checkMoodTrack != null) {
      updateMoodTrack(req.year, req.month, req);
    } else {
      addMoodTrack(req);
    }
  }

  @override
  Future<void> updateMoodTrack(
      int year, int month, MoodTrackResModel req) async {
    final data = await getListMoodTrack();
    int index = data.indexWhere((el) => el.year == year && el.month == month);
    if (index != -1) {
      MoodTrackResModel updateMoodTrackValue = MoodTrackResModel(
          year: year, month: month, listMoodTrack: req.listMoodTrack);
      data[index] = updateMoodTrackValue;
    }
    await write(cacheListMoodTrack, data.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> addMoodTrack(MoodTrackResModel req) async {
    final data = await getListMoodTrack();
    data.add(req);
    await write(cacheListMoodTrack, data.map((e) => e.toJson()).toList());
  }
}
