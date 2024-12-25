import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gorin_test/data/models/user_model.dart';

abstract class UserRepository {
  Future<void> addUser(UserModel user);
  Future<UserModel?> getUser(String uid);
  Future<List<UserModel>> fetchAllUsers();
  Future<String> uploadProfilePhoto(String userId, File file);
  Future<User?> registerUser(String email, String password);
  Future<User?> loginUser(String email, String password);
}
