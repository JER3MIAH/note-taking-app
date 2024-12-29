import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/side_bar_nav_cubit.dart';

void main() {
  late SideBarNavCubit sideBarNavCubit;

  setUp(() {
    sideBarNavCubit = SideBarNavCubit();
  });

  tearDown(() {
    sideBarNavCubit.close();
  });

  group('Side Bar Navigation Cubit -', () {
    blocTest<SideBarNavCubit, SideBarItem>(
      'Initial state is [SideBarItem.allNotes]',
      build: () => SideBarNavCubit(),
      verify: (bloc) {
        expect(bloc.state, SideBarItem.allNotes);
      },
    );
    blocTest<SideBarNavCubit, SideBarItem>(
      'emits provided item [allNotes] when setSideBarItem is called.',
      build: () => SideBarNavCubit(),
      act: (bloc) => bloc.setSideBarItem(SideBarItem.archivedNotes),
      expect: () => [SideBarItem.archivedNotes],
    );
  });
}
