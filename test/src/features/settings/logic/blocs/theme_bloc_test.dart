import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/theme_bloc/theme_state.dart';

void main() {
  late ThemeBloc themeBloc;

  setUp(() {
    themeBloc = ThemeBloc();
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
      'emits [ThemeState] with new font when ChangeFont is added.',
      build: () => themeBloc,
      act: (bloc) => bloc.add(ChangeTheme(theme: AppTheme.dark)),
      expect: () => [ThemeState(appTheme: AppTheme.dark)],
    );
  });
}
