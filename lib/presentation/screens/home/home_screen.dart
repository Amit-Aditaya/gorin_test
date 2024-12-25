import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';
import 'package:gorin_test/presentation/providers/app_auth_provider.dart';
import 'package:gorin_test/presentation/providers/user_provider.dart';
import 'package:gorin_test/presentation/screens/login/login_screen.dart';
import 'package:gorin_test/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).listenToUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final authProvider = context.read<AppAuthProvider>();
            authProvider.logout();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
          child: const Icon(Icons.logout),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            Consumer<UserProvider>(builder: (context, userProvider, child) {
              if (userProvider.users.isEmpty) {
                return const Center(child: Text('No users found.'));
              }
              return Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = userProvider.users[index];
                      return UserCard(
                          imageString:
                              'https://picsum.photos/id/${Random().nextInt(100)}/200/300',
                          title: user.name);
                    }),
              );
            }),
          ],
        ));
  }
}
