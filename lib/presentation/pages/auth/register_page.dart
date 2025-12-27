import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/auth/login_page.dart';
import 'package:a3lnha/presentation/pages/auth/vertify_email.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تسجيل ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Image.asset("assets/images/Item Left.png"),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegisterMethodWidget(
                methodName: 'جوجل',
                imagePath: 'assets/images/google.png',
              ),
              SizedBox(height: 15.h),
              RegisterMethodWidget(
                methodName: 'الفيس بوك',
                imagePath: 'assets/images/facebook.png',
              ),
              SizedBox(height: 15.h),

              RegisterMethodWidget(
                methodName: 'أبل',
                imagePath: 'assets/images/apple.png',
              ),
              SizedBox(height: 20.h),

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
                      "أو",
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
              TextFormWithLabel(
                hintText: "اسمك",
                controller: nameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                labelText: "اسم",
              ),
              SizedBox(height: 15.h),

              TextFormWithLabel(
                hintText: "your@email.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                labelText: "بريد إلكتروني",
              ),
              SizedBox(height: 15.h),

              TextFormWithLabel(
                hintText: "كلمة المرور الخاصة بك",
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                labelText: "كلمة المرور",
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
              SizedBox(height: 30.h),
              CustomButton(
                text: "إنشاء حساب",
                onTap: () {
                  context.push(VertifyEmail());
                },
              ),
              SizedBox(height: 20.h),
              Text(
                "من خلال إنشاء حساب فإنك توافق على ذلك",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "سياسة الخصوصية",
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    " و ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "الشروط والأحكام",
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushAndRemoveUntil(LoginPage());
                    },
                    child: Text(
                      "تسجيل الدخول  ",
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "هل لديك حساب بالفعل؟",
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

class RegisterMethodWidget extends StatelessWidget {
  final String methodName;
  final String imagePath;
  const RegisterMethodWidget({
    super.key,
    required this.methodName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "تواصل مع $methodName",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 6.w),
          Image.asset(imagePath, height: 20.h, width: 20.w),
        ],
      ),
    );
  }
}
