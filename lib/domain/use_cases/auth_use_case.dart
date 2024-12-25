import 'package:gorin_test/data/data_sources/firebase_data_source.dart';
import 'package:gorin_test/data/models/user_model.dart';

import '../repositories/user_repository.dart';

class AuthUseCase {
  final UserRepository userRepository;

  AuthUseCase({required this.userRepository});

  Future<void> registerUser(String name, String email, String password,
      String profilePhotoPath) async {
    // Register the user
    final user = await FirebaseDataSource().register(email, password);
    if (user != null) {
      // Upload profile photo

      //Needs Firebase storage
      // final photoUrl = await userRepository.uploadProfilePhoto(
      //     user.uid, File(profilePhotoPath));

      // Save user to Firestore
      final newUser = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        profilePhoto: "",
      );
      await userRepository.addUser(newUser);
    }
  }

  Future<UserModel?> getUserDetails(String uid) async {
    return await userRepository.getUser(uid);
  }
}
