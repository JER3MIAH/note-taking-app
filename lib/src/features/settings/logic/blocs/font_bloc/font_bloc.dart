import 'package:flutter_bloc/flutter_bloc.dart';
import 'font_state.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  FontBloc() : super(const FontState()) {
    on<ChangeFont>((event, emit) {
      emit(state.copyWith(appFont: event.font));
    });
  }
}
