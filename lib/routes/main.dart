// Routes

import 'package:earpy_app/presentations/views/initial/index.dart';
import 'package:earpy_app/presentations/views/instruction/index.dart';
import 'package:earpy_app/presentations/views/journal/index.dart';
import 'package:earpy_app/presentations/views/track/index.dart';
import 'package:earpy_app/routes/path.dart';
import './../configs/routes.dart';
import './binding.dart';

class RoutesInit {
  RoutesInit._();

  static const INITIAL_SCREEN = Alias.INITIAL;

  static final ROUTES = [
    PathRoutes.create(
        alias: Alias.INITIAL,
        view: () => const InitialView(),
        bindings: InitialBinding()),
    PathRoutes.create(
        alias: Alias.DAILY_JOURNAL,
        view: () => const JournalView(),
        bindings: JournalBinding()),
    PathRoutes.create(
        alias: Alias.MOOD_TRACK,
        view: () => const TrackView(),
        bindings: TrackBinding()),
    PathRoutes.create(
        alias: Alias.BREATH_INSTRUCTION,
        view: () => const InstructionView(),
        bindings: InstructionBinding()),
  ];
}
