import 'package:equatable/equatable.dart';
import 'package:note_taking_app/src/features/settings/data/enums/enums.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final AppTheme theme;
  const ChangeTheme({
    required this.theme,
  });

  @override
  List<Object?> get props => [theme];
}
