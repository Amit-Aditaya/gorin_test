// providers/auth_provider.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppAuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _auth.currentUser != null;

  Future<bool> checkLoginStatus() async {
    _isLoggedIn = _auth.currentUser != null;
    //  / notifyListeners();
    return _isLoggedIn;
  }

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
