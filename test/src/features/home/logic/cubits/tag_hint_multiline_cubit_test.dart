import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/tag_hint_multiline_cubit.dart';

void main() {
  late TagHintMultilineCubit tagHintMultilineCubit;

  setUp(() {
    tagHintMultilineCubit = TagHintMultilineCubit();
  });

  tearDown(() {
    tagHintMultilineCubit.close();
  });

  group('Side Bar Navigation Cubit -', () {
    blocTest<TagHintMultilineCubit, bool>(
      'Initial state is [false]',
      build: () => TagHintMultilineCubit(),
      verify: (bloc) {
        expect(bloc.state, false);
      },
    );
    blocTest<TagHintMultilineCubit, bool>(
      'emits provided item [true] when setValue is called.',
      build: () => TagHintMultilineCubit(),
      act: (bloc) => bloc.setValue(true),
      expect: () => [true],
    );
  });
}
