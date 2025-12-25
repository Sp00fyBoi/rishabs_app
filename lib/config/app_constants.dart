class AppConstants {
  // App Info
  static const String appName = 'Rishabh\'s App';
  static const String appVersion = '1.0.0';

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration splashScreenDuration = Duration(seconds: 1);

  // API
  static const String apiBaseUrl = 'YOUR_API_BASE_URL';

  // Routes
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String signupRoute = '/signup';

  // Messages
  static const String networkError = 'Network error. Please try again.';
  static const String unknownError = 'Something went wrong. Please try again.';
}
