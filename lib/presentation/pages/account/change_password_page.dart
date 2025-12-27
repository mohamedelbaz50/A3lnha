import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "تغير كلمة السر"),
      body: Column(
        children: [
          UserInfoWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                padding: EdgeInsets.all(16.h),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    TextFormWithLabel(
                      hintText: "*****************",
                      controller: oldPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      labelText: "كلمة السر القديمة",
                    ),
                    SizedBox(height: 15.h),
                    TextFormWithLabel(
                      hintText: "*****************",
                      controller: newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      labelText: "كلمة السر الجديدة",
                    ),
                    SizedBox(height: 15.h),
                    TextFormWithLabel(
                      hintText: "*****************",
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      labelText: "تاكيد كلمة السر الجديدة",
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(text: "حفظ", onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
