import 'package:flutter/material.dart';

// Import all pages
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/onboarding/onboarding_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/camera/camera_page.dart';
import '../../presentation/pages/profile/profile_page.dart';
import '../../presentation/pages/analytics/analytics_page.dart';
import '../../presentation/pages/settings/settings_page.dart';
import '../../presentation/pages/account/account_page.dart';
import '../../presentation/pages/drink_database/drink_database_page.dart';
import '../../presentation/pages/drink_database/edit_drink_page.dart';  // Add this
import '../../presentation/pages/notifications/notifications_page.dart';  // Add this
import '../../presentation/pages/rippl_score/rippl_score_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String camera = '/camera';
  static const String profile = '/profile';
  static const String analytics = '/analytics';
  static const String settings = '/settings';
  static const String account = '/account';
  static const String drinkDatabase = '/drink-database';
  static const String editDrink = '/edit-drink';           // Add this
  static const String notifications = '/notifications';   // Add this
  static const String ripplScore = '/rippl-score';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    onboarding: (context) => const OnboardingPage(),
    home: (context) => const HomePage(),
    camera: (context) => const CameraPage(),
    profile: (context) => const ProfilePage(),
    analytics: (context) => const AnalyticsPage(),
    settings: (context) => const SettingsPage(),
    account: (context) => const AccountPage(),
    drinkDatabase: (context) => const DrinkDatabasePage(),
    editDrink: (context) => const EditDrinkPage(),        // Add this
    notifications: (context) => const NotificationsPage(), // Add this
    ripplScore: (context) => const RipplScorePage(),
  };
}