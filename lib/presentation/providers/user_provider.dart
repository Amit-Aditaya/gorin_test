import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gorin_test/data/models/user_model.dart';
import 'package:gorin_test/domain/use_cases/auth_use_case.dart';

class UserProvider with ChangeNotifier {
  final AuthUseCase authUseCase;

  List<UserModel> _users = [];
  UserModel? _currentUser;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;

  UserProvider({required this.authUseCase});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(String name, String email, String password,
      String profilePhotoPath) async {
    await authUseCase.registerUser(name, email, password, profilePhotoPath);
    // await fetchAllUsers();
  }

  Future<void> fetchAllUsers() async {
    _users = await authUseCase.userRepository.fetchAllUsers();
    notifyListeners();
  }

  Future<void> loadCurrentUser(String uid) async {
    _currentUser = await authUseCase.getUserDetails(uid);
    notifyListeners();
  }

  void listenToUsers() {
    _firestore.collection('users').snapshots().listen((snapshot) {
      _users = snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data(), doc.id);
      }).toList();
      notifyListeners();
    });
  }
}
