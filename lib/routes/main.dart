// Routes

import 'package:earpy_app/presentations/views/initial/index.dart';
import 'package:earpy_app/presentations/views/instruction/index.dart';
import 'package:earpy_app/presentations/views/journal/historylistview.dart';
import 'package:earpy_app/presentations/views/journal/index.dart';
import 'package:earpy_app/presentations/views/journal/notesdisplayview.dart';
import 'package:earpy_app/presentations/views/journal/noteview.dart';
import 'package:earpy_app/presentations/views/track/index.dart';
import 'package:earpy_app/routes/path.dart';
import './../configs/routes.dart';
import './binding.dart';

class RoutesInit {
  RoutesInit._();

  static const INITIAL_SCREEN = Alias.initial;

  static final ROUTES = [
    PathRoutes.create(
        alias: Alias.initial,
        view: () => const InitialView(),
        bindings: InitialBinding()),
    PathRoutes.create(
        alias: Alias.dailyJournal,
        view: () => const JournalView(),
        bindings: JournalBinding()),
    PathRoutes.create(
        alias: Alias.moodTrack,
        view: () => const TrackView(),
        bindings: TrackBinding()),
    PathRoutes.create(
        alias: Alias.breathInstruction,
        view: () => const InstructionView(),
        bindings: InstructionBinding()),
    PathRoutes.create(
        alias: Alias.historyList,
        view: () => const HistoryListView(),
        bindings: HistoryListBinding()),
    PathRoutes.create(
        alias: Alias.note,
        view: () => const NoteView(),
        bindings: NoteBinding()),
    PathRoutes.create(
        alias: Alias.notesDisplay,
        view: () => const NotesDisplayView(),
        bindings: NotesDisplayBinding()),
  ];
}
