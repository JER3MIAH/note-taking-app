enum AppTheme { light, dark, system }

extension AppThemeExtension on String {
  AppTheme toAppTheme() {
    switch (this) {
      case 'light':
        return AppTheme.light;
      case 'dark':
        return AppTheme.dark;
      case 'system':
        return AppTheme.system;
      default:
        throw ArgumentError('Invalid AppTheme: $this');
    }
  }
}
