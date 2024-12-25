import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/core/utils/validator.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';
import 'package:gorin_test/core/widgets/snackbars/app_snackbar.dart';
import 'package:gorin_test/core/widgets/textfields/primary_textfeild.dart';
import 'package:gorin_test/core/widgets/texts/emphasis_text.dart';
import 'package:gorin_test/core/widgets/texts/info_text.dart';
import 'package:gorin_test/presentation/providers/app_auth_provider.dart';
import 'package:gorin_test/presentation/screens/home/home_screen.dart';
import 'package:gorin_test/presentation/screens/login/sign_up_screen.dart';
import 'package:gorin_test/presentation/widgets/login_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;

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
              isObscure: isObscure,
              controller: _passwordController,
              validator: Validators.validatePassword,
              hintText: 'password',
              suffixIcon: InkWell(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(AppColors.grey),
                ),
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
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final authProvider = context.read<AppAuthProvider>();
                    try {
                      await authProvider.login(
                          _emailController.text, _passwordController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    } on FirebaseException catch (e) {
                      AppSnackBar.show(context,
                          message: 'Login Failed: ${e.message}');
                    }
                  }
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
