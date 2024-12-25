import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/core/utils/validator.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';
import 'package:gorin_test/core/widgets/textfields/primary_textfeild.dart';
import 'package:gorin_test/core/widgets/texts/emphasis_text.dart';
import 'package:gorin_test/core/widgets/texts/info_text.dart';
import 'package:gorin_test/presentation/widgets/login_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: .1.sh,
            ),
            const InfoText(text: "Sign up with email"),
            SizedBox(
              height: .025.sh,
            ),
            Container(
              width: .125.sh,
              height: .125.sh,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(AppColors.darkBlueColor), // Facebook blue color
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: .075.sh,
              ),
            ),
            SizedBox(
              height: .025.sh,
            ),
            PrimaryTextfield(
                hintText: 'Name',
                validator: Validators.validateFullName,
                controller: _nameController),
            SizedBox(
              height: .02.sh,
            ),
            PrimaryTextfield(
                hintText: 'Email',
                validator: Validators.validateFullName,
                controller: _nameController),
            SizedBox(
              height: .02.sh,
            ),
            PrimaryTextfield(
                hintText: 'Password',
                validator: Validators.validateFullName,
                suffixIcon: const Icon(
                  Icons.visibility,
                  color: Color(AppColors.grey),
                ),
                controller: _nameController),
            SizedBox(
              height: .05.sh,
            ),
            LoginButton(text: "Sign Up", onTap: () {}),
            SizedBox(
              height: .04.sh,
            ),
            const InfoText(text: 'Already have an accout?'),
            SizedBox(
              height: .01.sh,
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const EmphasisText(text: "Login"))
          ],
        ),
      ),
    ));
  }
}
