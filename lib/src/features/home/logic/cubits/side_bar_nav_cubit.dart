import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/src/features/home/data/data.dart';

class SideBarNavCubit extends Cubit<SideBarItem> {
  SideBarNavCubit() : super(SideBarItem.allNotes);

  void setSideBarItem(SideBarItem value) {
    if (state != value) {
      emit(value);
    }
  }
}
