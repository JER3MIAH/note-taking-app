import 'package:equatable/equatable.dart';
import 'package:note_taking_app/src/features/theme/data/enums/enums.dart';
export 'theme_bloc.dart';
export 'theme_event.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({
    this.appTheme = AppTheme.system,
  });

  @override
  List<Object> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
