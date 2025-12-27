import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VertifyEmail extends StatelessWidget {
  const VertifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التحقق من البريد الإلكتروني "),
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
            children: [
              Text(
                "للتحقق من حسابك، أدخل رمز التحقق أرسلت إلى fdsfsdf@gmail.com",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Expanded(
                    child: OtpTextField(
                      numberOfFields: 4,
                      fieldHeight: 50.h,
                      borderColor: Colors.grey[300]!,
                      focusedBorderColor: Colors.grey[300]!,
                      showFieldAsBox: true,
                      borderRadius: BorderRadius.circular(12.r),
                      fieldWidth: 60.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: "تأكيد",
                onTap: () {
                  context.pushAndRemoveUntil(HomePage());
                },
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("لم تستلم الرمز؟"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "إعادة إرسال",
                      style: TextStyle(color: AppColors.lightBlue),
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
