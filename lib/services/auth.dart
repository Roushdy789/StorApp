import 'package:firebase_auth/firebase_auth.dart';

///the class for auth
abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<User?> registerWithEmailAndPassword(String email, String password);
  Future<void> logout();
}

class Auth implements AuthBase {
  ///the variable for auth
  final _firebaseAuth = FirebaseAuth.instance;

  ///the method for login
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

/////the method for register
  @override
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  ///the method for get STATE FOR AUTH
  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  ///the method for get current user
  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();
}
