import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gorin_test/domain/repositories/user_repository.dart';

import '../data_sources/firebase_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDataSource firebaseDataSource;

  UserRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<void> addUser(UserModel user) async {
    await firebaseDataSource.addUser(user.uid, user.toMap());
  }

  @override
  Future<UserModel?> getUser(String uid) async {
    final data = await firebaseDataSource.getUserData(uid);
    return data != null ? UserModel.fromMap(data, uid) : null;
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    final usersData = await firebaseDataSource.getAllUsers();
    return usersData
        .map((data) => UserModel.fromMap(data, data['uid'] as String))
        .toList();
  }

  @override
  Future<String> uploadProfilePhoto(String userId, File file) async {
    return await firebaseDataSource.uploadProfileImage(userId, file);
  }

  @override
  Future<User?> registerUser(String email, String password) async {
    return await firebaseDataSource.register(email, password);
  }
}
