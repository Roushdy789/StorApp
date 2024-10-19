import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/services/auth.dart';
import 'package:storeapp/utilities/enum.dart';

class AuthControllers with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFromType authfromtype;

  AuthControllers(
      {this.email = '',
      this.password = '',
      required this.auth,
      this.authfromtype = AuthFromType.login}) {
    //FirebaseAuth.instance.setLanguageCode('en');
  }

  Future<void> submit() async {
    try {
      if (authfromtype == AuthFromType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.registerWithEmailAndPassword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }

  ///the methds for choosing between login and register
  void toggleFormType() {
    final formType = authfromtype == AuthFromType.login
        ? AuthFromType.register
        : AuthFromType.login;
    copywith(email: '', password: '', authfromtype: formType);
  }

  void updatEmail(String email) {
    copywith(email: email);
  }

  void updatPassword(String password) {
    copywith(password: password);
  }

  void copywith({String? email, String? password, AuthFromType? authfromtype}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authfromtype = authfromtype ?? this.authfromtype;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await auth.logout();
    } catch (e) {
      rethrow;
    }
  }
}
