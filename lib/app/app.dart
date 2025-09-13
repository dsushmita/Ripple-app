import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../presentation/pages/auth/login_page.dart';
import 'routes/app_routes.dart';

class RippleApp extends StatelessWidget {
  const RippleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}