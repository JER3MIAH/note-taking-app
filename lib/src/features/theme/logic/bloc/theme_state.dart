import 'package:equatable/equatable.dart';
export 'theme_bloc.dart';
export 'theme_event.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  const ThemeState({
    this.isDarkMode = false,
  });

  @override
  List<Object?> get props => [isDarkMode];

  ThemeState copyWith({
    bool? isDarkMode,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
