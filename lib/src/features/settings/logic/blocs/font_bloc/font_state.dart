import 'package:equatable/equatable.dart';
import 'package:note_taking_app/src/features/settings/data/enums/app_font.dart';
export 'font_bloc.dart';
export 'font_event.dart';

class FontState extends Equatable {
  final AppFont appFont;
  const FontState({
    this.appFont = AppFont.serif,
  });

  @override
  List<Object> get props => [appFont];

  FontState copyWith({
    AppFont? appFont,
  }) {
    return FontState(
      appFont: appFont ?? this.appFont,
    );
  }
}
