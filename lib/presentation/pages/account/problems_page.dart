import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemsPage extends StatefulWidget {
  ProblemsPage({super.key});

  @override
  State<ProblemsPage> createState() => _ProblemsPageState();
}

class _ProblemsPageState extends State<ProblemsPage> {
  final TextEditingController problemController = TextEditingController();
  int? selectedIndex;
  Widget buildCheckbox(String label, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: selectedIndex == index,
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedIndex = index;
              } else {
                selectedIndex = null;
              }
            });
          },
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "الشكاوى"),
      body: Column(
        children: [
          UserInfoWidget(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormWithLabel(
                      hintText: "اكتب هنا",
                      controller: problemController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      labelText: "اكتب شكواك",
                      maxlines: 6,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Vector (Stroke).png",
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "قم بارفاق صورة من ايصال الحوالة",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "تحديد نوع البلاغ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCheckbox("الحصول علي المعلومات", 0),
                          buildCheckbox("مشكلة في إرسال أوراق أو إشعارات", 1),
                          buildCheckbox("شكر أو توصيه", 2),
                          buildCheckbox("طلب", 3),

                          SizedBox(height: 15),

                          Center(
                            child: Container(
                              width: 75.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: Text(
                                  "ارسال",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
