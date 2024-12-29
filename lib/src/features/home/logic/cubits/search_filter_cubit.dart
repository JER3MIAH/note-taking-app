import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterCubit extends Cubit<String> {
  SearchFilterCubit() : super('');

  void setFilter(String value) {
    if (state != value) {
      emit(value);
    }
  }
}
