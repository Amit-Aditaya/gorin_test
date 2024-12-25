import 'dart:io';

import 'package:gorin_test/data/models/user_model.dart';

import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  /// Adds a new user to the database
  Future<void> addUser(UserModel user) async {
    await userRepository.addUser(user);
  }

  /// Fetches a single user's details by their UID
  Future<UserModel?> getUserDetails(String uid) async {
    return await userRepository.getUser(uid);
  }

  /// Fetches all users from the database
  Future<List<UserModel>> fetchAllUsers() async {
    return await userRepository.fetchAllUsers();
  }

  /// Uploads a user's profile photo to Firebase Storage and returns its URL
  Future<String> uploadProfilePhoto(String userId, File photo) async {
    return await userRepository.uploadProfilePhoto(userId, photo);
  }
}
