// providers/auth_provider.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gorin_test/domain/use_cases/auth_use_case.dart';

class AppAuthProvider with ChangeNotifier {
  final AuthUseCase authUseCase;

  AppAuthProvider(this.authUseCase);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _auth.currentUser != null;

  Future<bool> checkLoginStatus() async {
    _isLoggedIn = _auth.currentUser != null;
    //  / notifyListeners();
    return _isLoggedIn;
  }

  Future<void> login(String email, String password) async {
    //   await _auth.signInWithEmailAndPassword(email: email, password: password);
    await authUseCase.loginUser(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await authUseCase.logout();
    notifyListeners();
  }
}
