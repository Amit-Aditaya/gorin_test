import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/core/utils/validator.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';
import 'package:gorin_test/core/widgets/textfields/primary_textfeild.dart';
import 'package:gorin_test/core/widgets/texts/emphasis_text.dart';
import 'package:gorin_test/core/widgets/texts/info_text.dart';
import 'package:gorin_test/presentation/screens/login/sign_up_screen.dart';
import 'package:gorin_test/presentation/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.25.sh,
            ),
            const InfoText(text: 'Login with email'),
            SizedBox(
              height: 0.05.sh,
            ),
            PrimaryTextfield(
              controller: _emailController,
              hintText: 'email',
              validator: Validators.validateEmail,
            ),
            SizedBox(
              height: 0.025.sh,
            ),
            PrimaryTextfield(
              controller: _passwordController,
              validator: Validators.validatePassword,
              hintText: 'password',
              suffixIcon: const Icon(
                Icons.visibility,
                color: Color(AppColors.grey),
              ),
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            const EmphasisText(text: "Forgot Password ?"),
            SizedBox(
              height: 0.03.sh,
            ),
            LoginButton(
                text: 'Login',
                onTap: () {
                  //  if (_formKey.currentState!.validate()) {}
                }),
            SizedBox(
              height: 0.05.sh,
            ),
            const InfoText(text: "Don't have an account"),
            SizedBox(
              height: 0.01.sh,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: const EmphasisText(text: 'Sign Up'))
          ],
        ),
      ),
    ));
  }
}
