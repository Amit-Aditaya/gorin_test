import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  //const UserCard({super.key});
  final String imageString;
  final String title;

  const UserCard({super.key, required this.imageString, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: .025.sh,
        backgroundImage: NetworkImage(imageString),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(title),
    );
  }
}
