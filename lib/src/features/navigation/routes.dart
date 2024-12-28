abstract class AppRoutes {}

class HomeRoutes extends AppRoutes {
  static const main = '/';
  static const tagSelected = '/tagSelectedScreen';
  static const createOrViewNote = '/createOrViewNoteScreen';
}

class AuthRoutes extends AppRoutes {
  static const login = '/loginScreen';
  static const signup = '/signupScreen';
}

class SettingRoutes extends AppRoutes {
  static const colorTheme = '/colorThemeScreen';
  static const fontTheme = '/fontThemeScreen';
  static const changePassword = '/changePasswordScreen';
}
