import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/problems_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoAboutAppPage extends StatelessWidget {
  const InfoAboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "معلومات التطبيق"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Map.png"),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AboutAppItem(
              title: "اسم المنشأة:",
              value: "Aalenha.com",
              valueColor: AppColors.darkBlue,
            ),
            AboutAppItem(
              title: "الاسم التجاري:",
              value:
                  "شركة أعلنها - aalenha لتقنيات المعلومات والتسويق والتجارة",
              valueColor: AppColors.darkBlue,
            ),
            AboutAppItem(
              title: "الشخص المسؤول:",
              value: "------------",
              valueColor: Colors.grey,
            ),
            AboutAppItem(
              title: "رقم السجل التجاري:",
              value: "------------",
              valueColor: Colors.red,
            ),
            AboutAppItem(
              title: "عنوان البريد الإلكتروني الرسمي (KEP):",
              value: " aalenha@hs02.kep.tr",
              valueColor: Colors.grey,
            ),
            AboutAppItem(
              title: "رقم MERSİS (نظام تسجيل الشركات):",
              value: "0739014655600017",
              valueColor: Colors.grey,
            ),
            AboutAppItem(
              title: " مركز الاتصال:",
              value: "08****** 44",
              valueColor: Colors.grey,
            ),
            AboutAppItem(
              title: "مركز الدعم",
              value: "التوجه لقسم البلاغات و المساعدة",
              valueColor: AppColors.darkBlue,
              isClicked: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutAppItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final bool isClicked;

  const AboutAppItem({
    super.key,
    required this.title,
    required this.value,
    required this.valueColor,
    this.isClicked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  isClicked ? context.push(ProblemsPage()) : null;
                },
                child: Row(
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: valueColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    isClicked
                        ? Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.darkBlue,
                            size: 12.sp,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 1.5, height: 35.h),
        ],
      ),
    );
  }
}
