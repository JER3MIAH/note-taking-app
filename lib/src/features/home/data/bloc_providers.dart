import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_event.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/bottom_nav_bar_cubit.dart';
import 'package:note_taking_app/src/features/home/logic/cubits/side_bar_nav_cubit.dart';

final List<BlocProvider> homeBlocProviders = [
  BlocProvider<NoteBloc>(
    create: (_) => getIt<NoteBloc>()
      ..add(GetSelectedNote())
      ..add(GetNotes()),
  ),
  BlocProvider<TagBloc>(
    create: (_) => getIt<TagBloc>()
      ..add(GetSelectedTag())
      ..add(GetTags()),
  ),
  BlocProvider<BottomNavBarCubit>(
    create: (_) => getIt<BottomNavBarCubit>(),
  ),
  BlocProvider<SideBarNavCubit>(
    create: (_) => getIt<SideBarNavCubit>(),
  ),
];
