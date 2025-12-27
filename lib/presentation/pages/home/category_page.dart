import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/favourite_ads_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  const CategoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "اختيار الفئة"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: ListView(
            children: [
              CategoryItem(
                title: 'جميع اعلانات "العقارات".',
                isAll: true,
                appBarTitle: title,
              ),
              CategoryItem(title: 'سكني', appBarTitle: title),
              CategoryItem(title: 'تجاري', appBarTitle: title),
              CategoryItem(title: 'أرض', appBarTitle: title),
              CategoryItem(title: 'تطوير الإسكان', appBarTitle: title),
              CategoryItem(title: 'المباني', appBarTitle: title),
              CategoryItem(title: 'المشاركة بالوقت', appBarTitle: title),
              CategoryItem(title: 'المشاركة بالوقت', appBarTitle: title),
              CategoryItem(title: 'أرض', appBarTitle: title),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool isAll;
  final String title;
  final String appBarTitle;
  const CategoryItem({
    super.key,
    this.isAll = false,
    required this.title,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(FavouriteAdsPage(title: appBarTitle));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.lightBlue,
                    size: 13.sp,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "(1,152,213)",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  color: isAll ? AppColors.lightBlue : Colors.black,
                  fontSize: 12.sp,
                  fontWeight: isAll ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
          Divider(thickness: 1.5, height: 50.h),
        ],
      ),
    );
  }
}
