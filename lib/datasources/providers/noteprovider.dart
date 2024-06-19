import 'package:earpy_app/configs/session.dart';
import 'package:earpy_app/datasources/models/request/notereqmodel.dart';
import 'package:collection/collection.dart'; // Tambahkan ini untuk firstWhereOrNull

abstract class NoteProviderAbs {
  Future<void> addNote(NoteModel note);
  Future<void> updateNote(String id, NoteModel note);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> getListNote();
  Future<int> getCountNote();
  void cacheCount(int total);
  void cacheNote(List<NoteModel> note);
  Future<int> getNoteLength();
  Future<NoteModel?> findNoteById(String id);
}

const cacheListNote = 'CACHE_NOTE';
const cacheCountNote = 'CACHE_COUNT_NOTE';

class NoteProviderImpl extends SessionStorage implements NoteProviderAbs {
  @override
  Future<void> addNote(NoteModel note) async {
    final data = await getListNote();
    data.add(note);
    await write(cacheListNote, data.map((e) => e.toJson()).toList());
    cacheCount(data.length); // Update cache count after adding new Note
  }

  @override
  Future<void> updateNote(String id, NoteModel note) async {
    final data = await getListNote();
    int index = data.indexWhere((el) => el.id == id);
    if (index != -1) {
      NoteModel updateNoteValue =
          NoteModel(id: id, title: note.title, content: note.content);
      data[index] = updateNoteValue;
    }
    await write(cacheListNote, data.map((e) => e.toJson()).toList());
    cacheCount(data.length); // Update cache count after adding new Note
  }

  @override
  Future<void> deleteNote(String id) async {
    final data = await getListNote();
    data.removeWhere((el) => el.id == id);
    await write(cacheListNote, data.map((e) => e.toJson()).toList());
    cacheCount(data.length); // Update cache count after adding new Note
  }

  @override
  Future<List<NoteModel>> getListNote() async {
    final cachedList = await read(cacheListNote);

    if (cachedList is List<NoteModel>) {
      return cachedList;
    }
    if (cachedList is List<dynamic>) {
      return cachedList.map((e) => NoteModel.fromJson(e)).toList();
    } else {
      return <NoteModel>[];
    }
  }

  @override
  Future<int> getCountNote() async {
    final count = await read(cacheCountNote);
    return count ?? 0;
  }

  @override
  void cacheCount(int total) async {
    await write(cacheCountNote, total);
  }

  @override
  void cacheNote(List<NoteModel> note) async {
    final cachedList = await read(cacheListNote);
    final list = cachedList is List<dynamic>
        ? cachedList.map((e) => NoteModel.fromJson(e)).toList()
        : [];

    list.addAll(note);
    write(cacheListNote, list.map((e) => e.toJson()).toList());
    cacheCount(list.length); // Update cache count after caching new Note
  }

  @override
  Future<int> getNoteLength() async {
    final list = await getListNote();
    return list.length;
  }

  @override
  Future<NoteModel?> findNoteById(String id) async {
    final list = await getListNote();
    return list.firstWhereOrNull((note) => note.id == id);
  }
}
