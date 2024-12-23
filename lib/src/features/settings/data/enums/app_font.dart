enum AppFont { sanserif, serif, monospace }

extension AppFontString on AppFont {
  String toStringg() {
    return name;
  }
}

extension AppFontExtension on String {
  AppFont toAppFont() {
    switch (this) {
      case 'serif':
        return AppFont.serif;
      case 'sanserif':
        return AppFont.sanserif;
      case 'monospace':
        return AppFont.monospace;
      default:
        throw ArgumentError('Invalid AppFont: $this');
    }
  }
}
