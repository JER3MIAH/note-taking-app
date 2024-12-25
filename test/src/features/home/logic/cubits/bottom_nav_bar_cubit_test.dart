import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';

void main() {
  late BottomNavBarCubit bottomNavBarCubit;

  setUp(() {
    bottomNavBarCubit = BottomNavBarCubit();
  });

  tearDown(() {
    bottomNavBarCubit.close();
  });

  group('Bottom Navigation Bar Cubit -', () {
    blocTest<BottomNavBarCubit, int>(
      'Initial state is [0]',
      build: () => BottomNavBarCubit(),
      verify: (bloc) {
        expect(bloc.state, 0);
      },
    );
    blocTest<BottomNavBarCubit, int>(
      'emits provided index [2] when setIndex is called.',
      build: () => BottomNavBarCubit(),
      act: (bloc) => bloc.setIndex(2),
      expect: () => [2],
    );
  });
}
