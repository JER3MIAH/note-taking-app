import 'package:equatable/equatable.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_font.dart';

abstract class FontEvent extends Equatable {
  const FontEvent();

  @override
  List<Object> get props => [];
}

class GetSavedFontPrefs extends FontEvent {
  const GetSavedFontPrefs();
}

class ChangeFont extends FontEvent {
  final AppFont font;
  const ChangeFont({
    required this.font,
  });

  @override
  List<Object> get props => [font];
}
