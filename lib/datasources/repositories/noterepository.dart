import 'package:earpy_app/datasources/models/request/notereqmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:earpy_app/datasources/models/response/noteresmodel.dart';
import 'package:earpy_app/datasources/providers/noteprovider.dart';

abstract class NoteRepositoryAbs {
  Future<Either<String, NoteModel>> addNote(NoteModel note);
  Future<Either<String, String>> updateNote(String id, NoteModel note);
  Future<Either<String, String>> deleteNote(String id);
  Future<Either<String, NoteResModel>> listNotes();
  Future<Either<String, NoteModel>> getById(String id);
}

class NoteRepositoryImpl implements NoteRepositoryAbs {
  final local = NoteProviderImpl();
  late Either<String, NoteModel> response;

  @override
  Future<Either<String, NoteModel>> addNote(NoteModel note) async {
    // TODO: implement addNote
    try {
      await local.addNote(note);
      return Right(note);
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }

  @override
  Future<Either<String, NoteResModel>> listNotes() async {
    // TODO: implement listHistories
    try {
      final listNote = await local.getListNote();
      final countNote = await local.getCountNote();
      if (listNote.isNotEmpty) {
        final historiesData =
            NoteResModel(listNotes: listNote, countNote: countNote);

        return Right(historiesData);
      }
      return const Left("Notes Belum Tersedia");
    } catch (e) {
      return const Left("Terjadi Kesalahan Pada Data");
    }
  }

  @override
  Future<Either<String, String>> deleteNote(String id) async {
    try {
      await local.deleteNote(id);
      return const Right("Data Terhapus");
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }

  @override
  Future<Either<String, String>> updateNote(String id, NoteModel note) async {
    try {
      await local.updateNote(id, note);
      return const Right("Data Terbaharui");
    } catch (e) {
      return const Left("Terjadi Kesalahan Input");
    }
  }

  @override
  Future<Either<String, NoteModel>> getById(String id) async {
    // TODO: implement getWhere
    try {
      final getData = await local.findNoteById(id);
      if (getData == null) {
        return const Left("Data Tidak Ditemukan");
      }
      return Right(getData);
    } catch (e) {
      return const Left("Terjadi Kesalahan Pada Data");
    }
  }
}
