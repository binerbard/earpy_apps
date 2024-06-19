import 'package:earpy_app/controllers/notecontroller.dart';
import 'package:earpy_app/controllers/notesdisplaycontroller.dart';
import 'package:earpy_app/controllers/historylistcontroller.dart';
import 'package:earpy_app/controllers/instructioncontroller.dart';
import 'package:earpy_app/controllers/journalcontroller.dart';
import 'package:earpy_app/controllers/trackcontroller.dart';
import 'package:get/get.dart';
import 'package:earpy_app/controllers/initial.dart';

// Binding Data
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}

class JournalBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<JournalController>(() => JournalController());
  }
}

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TrackController>(() => TrackController());
  }
}

class InstructionBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<InstructionController>(() => InstructionController());
  }
}

class HistoryListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HistoryListController>(() => HistoryListController());
  }
}

class NotesDisplayBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotesDisplayController>(() => NotesDisplayController());
  }
}

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<JournalController>(() => JournalController());
    Get.lazyPut<NoteController>(() => NoteController());
  }
}
