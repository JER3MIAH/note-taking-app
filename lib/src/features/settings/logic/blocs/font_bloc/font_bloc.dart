import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/settings/logic/services/services.dart';
import 'font_state.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final FontLocalService localService;
  FontBloc({
    required this.localService,
  }) : super(const FontState()) {
    on<GetSavedFontPrefs>((event, emit) async {
      final appFont = localService.getFontPreference();
      emit(state.copyWith(
        appFont: appFont,
      ));
    });

    on<ChangeFont>((event, emit) {
      emit(state.copyWith(appFont: event.font));
    });
  }
}
