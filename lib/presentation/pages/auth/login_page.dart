import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/auth/register_page.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تسجيل الدخول",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              TextFormWithLabel(
                hintText: 'your@email.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                labelText: 'بريد الكتروني',
              ),
              SizedBox(height: 30.h),
              TextFormWithLabel(
                hintText: "كلمة المرور الخاصة بك",
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                labelText: 'كلمة المرور',
                forgetPasswordButton: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: AppColors.lightBlue,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/Icon Right 1.png",
                    height: 60.h,
                    width: 60.w,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: "تسجيل الدخول",
                onTap: () {
                  context.pushAndRemoveUntil(HomePage());
                },
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      height: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Text(
                      "أو المتابعة مع",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      height: 1.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMehtodIcon(imagePath: "assets/images/google.png"),
                  SizedBox(width: 16.w),
                  SocialMehtodIcon(imagePath: "assets/images/facebook.png"),
                  SizedBox(width: 16.w),
                  SocialMehtodIcon(imagePath: "assets/images/apple.png"),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(RegisterPage());
                    },
                    child: Text(
                      "يسجل",
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "ليس لديك حساب؟",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMehtodIcon extends StatelessWidget {
  final String imagePath;
  const SocialMehtodIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Image.asset(imagePath, height: 24.h, width: 24.w),
      ),
    );
  }
}
