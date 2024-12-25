import 'package:flutter/material.dart';
import 'package:gorin_test/core/constants/constants.dart';
import 'package:gorin_test/core/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  // const AppScaffold({super.key});
  final Widget body;
  Widget? floatingActionButton;

  AppScaffold({super.key, required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.backgroundColor),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.appHorizontalPadding,
            vertical: Constants.appVerticalPadding),
        width: double.infinity,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
