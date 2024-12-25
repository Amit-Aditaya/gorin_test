import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/core/widgets/texts/emphasis_text.dart';

class LoginButton extends StatelessWidget {
  //const LoginButton({super.key});
  final String text;
  final Function onTap;

  const LoginButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: .065.sh,
        width: .35.sw,
        decoration: BoxDecoration(
          color: const Color(0xffc7c3eb),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(AppColors.grey).withOpacity(.25),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: EmphasisText(
            text: text,
          ),
        ),
      ),
    );
  }
}
