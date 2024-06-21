import 'package:dartz/dartz.dart';
import 'package:earpy_app/datasources/models/response/moodresmodel.dart';
import 'package:earpy_app/datasources/providers/moodtrackprovider.dart';
import 'package:earpy_app/logic/utils/dateformat.dart';

abstract class MoodTrackRepositoryAbs {
  Future<Either<String, MoodTrackResModel>> getMoodTracByMonthAndYear(
      int year, int month);
  Future<Either<String, String>> storeMoodTrack(MoodTrackResModel req);
}

class MoodTrackRepositoryImpl implements MoodTrackRepositoryAbs {
  final local = MoodTrackProviderImpl();

  @override
  Future<Either<String, MoodTrackResModel>> getMoodTracByMonthAndYear(
      int year, int month) async {
    try {
      final listMoodTrack = await local.getMoodTrackByMonthAndYear(year, month);

      if (listMoodTrack != null) {
        return Right(listMoodTrack);
      }
      final listMoodTrackGenerate = getDatesForMood(month, year);
      return Right(MoodTrackResModel(
          listMoodTrack: listMoodTrackGenerate, month: month, year: year));
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }

  @override
  Future<Either<String, String>> storeMoodTrack(MoodTrackResModel req) async {
    // TODO: implement storeMoodTrack
    try {
      await local.storeMoodTrack(req);
      return const Right("Data Tersimpan");
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }
}
