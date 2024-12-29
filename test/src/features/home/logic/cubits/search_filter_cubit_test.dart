import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/cubits.dart';

void main() {
  late SearchFilterCubit searchFilterCubit;

  setUp(() {
    searchFilterCubit = SearchFilterCubit();
  });

  tearDown(() {
    searchFilterCubit.close();
  });

  group('Bottom Navigation Bar Cubit -', () {
    blocTest<SearchFilterCubit, String>(
      'Initial state is ['']',
      build: () => SearchFilterCubit(),
      verify: (bloc) {
        expect(bloc.state, '');
      },
    );
    blocTest<SearchFilterCubit, String>(
      'emits provided index [filter] when setFilter is called.',
      build: () => SearchFilterCubit(),
      act: (bloc) => bloc.setFilter('filter'),
      expect: () => ['filter'],
    );
  });
}
