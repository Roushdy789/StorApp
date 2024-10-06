import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/utilities/routs.dart';
import 'package:storeapp/views/pages/bottom_Navbar.dart';
import 'package:storeapp/views/pages/landing_page.dart';
import 'package:storeapp/views/pages/auth_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouts.landingPage:
      return CupertinoPageRoute(builder: (context) => const LandingPage());
    case AppRouts.loginPage:
      return CupertinoPageRoute(builder: (context) => const AuthPage());
    case AppRouts.navbarpage:
      return CupertinoPageRoute(builder: (context) => const BottomNavbar());
    default:
      return MaterialPageRoute(builder: (context) => const LandingPage());
  }
}
