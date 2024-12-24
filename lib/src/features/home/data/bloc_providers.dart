import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/app_injection_container.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/note_bloc/note_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_event.dart';

final List<BlocProvider> homeBlocProviders = [
  BlocProvider<NoteBloc>(create: (_) => getIt<NoteBloc>()),
  BlocProvider<TagBloc>(create: (_) => getIt<TagBloc>()..add(GetSelectedTag())),
];
