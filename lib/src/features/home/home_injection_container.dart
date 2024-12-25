import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:note_taking_app/src/features/home/logic/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeInjectionContainer {
  static Future<void> init() async {
    //* Services
    getIt.registerLazySingleton<NoteLocalService>(
      () => NoteLocalService(prefs: getIt<SharedPreferences>()),
    );
    getIt.registerLazySingleton<TagLocalService>(
      () => TagLocalService(prefs: getIt<SharedPreferences>()),
    );

    //* Blocs
    getIt.registerLazySingleton<TagBloc>(
      () => TagBloc(
        localService: getIt<TagLocalService>(),
      ),
    );
    getIt.registerLazySingleton<NoteBloc>(
      () => NoteBloc(
        localService: getIt<NoteLocalService>(),
        tagBloc: getIt<TagBloc>(),
      ),
    );

    //* Cubits
    getIt.registerLazySingleton<BottomNavBarCubit>(
      () => BottomNavBarCubit(),
    );
  }
}
