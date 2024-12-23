import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';
import 'package:note_taking_app/src/features/settings/logic/services/theme_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late ThemeBloc themeBloc;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    themeBloc = ThemeBloc(localService: ThemeLocalService(prefs: prefs));
  });

  tearDown(() {
    themeBloc.close();
  });

  group('Font Bloc', () {
    blocTest<ThemeBloc, ThemeState>(
      'Initial state should be ThemeState(appTheme: AppTheme.system)',
      build: () => themeBloc,
      verify: (bloc) {
        final state = bloc.state;
        expect(state, ThemeState(appTheme: AppTheme.system));
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'emits [AppTheme] or null when [GetSavedThemePrefs] is added',
      build: () {
        return themeBloc;
      },
      act: (bloc) => bloc.add(GetSavedThemePrefs()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.appTheme,
          'App Theme',
          isA<AppTheme?>(),
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'emits [ThemeState] with new font when ChangeFont is added.',
      build: () => themeBloc,
      act: (bloc) => bloc.add(ChangeTheme(theme: AppTheme.dark)),
      expect: () => [ThemeState(appTheme: AppTheme.dark)],
    );
  });
}
