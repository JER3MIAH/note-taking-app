import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_font.dart';
import 'package:note_taking_app/src/features/settings/logic/blocs/font_bloc/font_state.dart';
import 'package:note_taking_app/src/features/settings/logic/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late FontBloc fontBloc;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    fontBloc = FontBloc(localService: FontLocalService(prefs: prefs));
  });

  tearDown(() {
    fontBloc.close();
  });

  group('Font Bloc', () {
    blocTest<FontBloc, FontState>(
      'Initial state should be FontState(appFont: AppFont.serif)',
      build: () => fontBloc,
      verify: (bloc) {
        final state = bloc.state;
        expect(state, FontState(appFont: AppFont.serif));
      },
    );

    blocTest<FontBloc, FontState>(
      'emits [FontState] with new font when ChangeFont is added.',
      build: () => fontBloc,
      act: (bloc) => bloc.add(ChangeFont(font: AppFont.monospace)),
      expect: () => [FontState(appFont: AppFont.monospace)],
    );
  });
}
