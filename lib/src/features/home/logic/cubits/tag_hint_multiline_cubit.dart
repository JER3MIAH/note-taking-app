import 'package:flutter_bloc/flutter_bloc.dart';

class TagHintMultilineCubit extends Cubit<bool> {
  TagHintMultilineCubit() : super(false);

  void setValue(bool value) {
    if (state != value) {
      emit(value);
    }
  }
}
