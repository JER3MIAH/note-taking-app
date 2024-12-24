import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/src/features/home/logic/blocs/tag_bloc/tag_bloc.dart';
import 'package:note_taking_app/src/features/home/logic/services/tag_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late TagBloc tagBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    tagBloc = TagBloc(localService: TagLocalService(prefs: prefs));
  });

  tearDown(() {
    tagBloc.close();
  });

  group('Tag Bloc -', () {});
}
