const String iconPath = 'assets/icons/';

final String iconArchive = 'icon-archive'.svg;
final String iconArrowLeft = 'icon-arrow-left'.svg;
final String iconCheckMark = 'icon-checkmark'.svg;
final String iconChevronRight = 'icon-chevron-right'.svg;
final String iconClock = 'icon-clock'.svg;
final String iconCross = 'icon-cross'.svg;
final String iconDelete = 'icon-delete'.svg;
final String iconFontMonoSpace = 'icon-font-monospace'.svg;
final String iconFontSansSerif = 'icon-font-sans-serif'.svg;
final String iconFontSerif = 'icon-font-serif'.svg;
final String iconFont = 'icon-font'.svg;
final String iconGoogle = 'icon-google'.svg;
final String iconHidePassword = 'icon-hide-password'.svg;
final String iconShowPassword = 'icon-show-password'.svg;
final String iconHome = 'icon-home'.svg;
final String iconInfo = 'icon-info'.svg;
final String iconLock = 'icon-lock'.svg;
final String iconLogout = 'icon-logout'.svg;
final String iconMenu = 'icon-menu'.svg;
final String iconMoon = 'icon-moon'.svg;
final String iconPlus = 'icon-plus'.svg;
final String iconRestore = 'icon-restore'.svg;
final String iconSearch = 'icon-search'.svg;
final String iconSettings = 'icon-settings'.svg;
final String iconStatus = 'icon-status'.svg;
final String iconSun = 'icon-sun'.svg;
final String iconSystemTheme = 'icon-system-theme'.svg;
final String iconTag = 'icon-tag'.svg;
final String logo = 'logo'.svg;
final String logoDark = 'logo-dark'.svg;

extension ImageExtension on String {
  String get svg => '$iconPath$this.svg';
}
