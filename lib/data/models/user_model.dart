class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profilePhoto;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePhoto,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profilePhoto: data['profilePhoto'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profilePhoto': profilePhoto,
    };
  }
}
