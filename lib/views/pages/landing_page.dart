import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/services/auth.dart';
import 'package:storeapp/views/pages/auth_page.dart';
import 'package:storeapp/views/pages/bottom_Navbar.dart';
import 'package:storeapp/views/pages/home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<dynamic>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const AuthPage();
          } else {
            return const Home();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
