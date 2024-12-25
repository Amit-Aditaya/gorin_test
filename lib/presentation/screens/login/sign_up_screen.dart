import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/core/utils/validator.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';
import 'package:gorin_test/core/widgets/textfields/primary_textfeild.dart';
import 'package:gorin_test/core/widgets/texts/emphasis_text.dart';
import 'package:gorin_test/core/widgets/texts/info_text.dart';
import 'package:gorin_test/presentation/providers/user_provider.dart';
import 'package:gorin_test/presentation/screens/home/home_screen.dart';
import 'package:gorin_test/presentation/widgets/login_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? profilePhoto;

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
            profilePhoto != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(profilePhoto!),
                  )
                : InkWell(
                    onTap: () async {
                      await pickImage();
                    },
                    child: Container(
                      width: .125.sh,
                      height: .125.sh,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                            AppColors.darkBlueColor), // Facebook blue color
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: .075.sh,
                      ),
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
                validator: Validators.validateEmail,
                controller: _emailController),
            SizedBox(
              height: .02.sh,
            ),
            PrimaryTextfield(
                hintText: 'Password',
                validator: Validators.validatePassword,
                suffixIcon: const Icon(
                  Icons.visibility,
                  color: Color(AppColors.grey),
                ),
                controller: _passwordController),
            SizedBox(
              height: .05.sh,
            ),
            LoginButton(
                text: "Sign Up",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final userProvider = context.read<UserProvider>();

                    try {
                      if (profilePhoto != null) {
                        await userProvider
                            .registerUser(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          profilePhoto!.path,
                        )
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please select a profile photo')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                }),
            SizedBox(
              height: .04.sh,
            ),
            const InfoText(text: 'Already have an account?'),
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

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePhoto = File(pickedFile.path);
      });
    }
  }
}
