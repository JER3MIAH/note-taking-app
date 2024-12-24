import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';

class HomeInjectionContainer {
  static Future<void> init() async {
    //* Services

    //* Blocs
    getIt.registerLazySingleton<NoteBloc>(
      () => NoteBloc(),
    );
    getIt.registerLazySingleton<TagBloc>(
      () => TagBloc(),
    );
  }
}
