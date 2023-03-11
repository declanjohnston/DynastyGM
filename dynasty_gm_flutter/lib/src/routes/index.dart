// routes for the app
import 'package:flutter/material.dart';

import '../screens/home/index.dart';
import '../screens/onboarding/authentication_screen.dart';
import '../splash_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => AuthenticationScreen());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
