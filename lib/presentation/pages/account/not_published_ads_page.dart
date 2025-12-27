import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/pages/home/ad_details_page.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotPublishedAdsPage extends StatelessWidget {
  const NotPublishedAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "لم يتم نشره"),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return NotPublishedAdWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: 7,
      ),
    );
  }
}

class NotPublishedAdWidget extends StatelessWidget {
  const NotPublishedAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AdDetailsPage());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/3d-rendering-loft-luxury-living-room-with-bookshelf-near-bookshelf_105762-2224.jpg",
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("جاجا مادا بيلبورد", style: TextStyle(fontSize: 14.sp)),
                LocationWidget(),
                SizedBox(height: 5.h),
                DetailsRow(
                  title: 'تاريخ نشر الاعلان',
                  value: '12/12/2024',
                  imageUrl: "assets/images/Vector.png",
                ),
                DetailsRow(
                  title: 'عدد المشاهدات',
                  value: '120',
                  imageUrl: "assets/images/eye.png",
                ),
                DetailsRow(
                  title: 'عدد الرسائل',
                  value: '5',
                  imageUrl: "assets/images/text.png",
                ),
                DetailsRow(
                  title: 'عدد المفضلة ',
                  value: '1',
                  imageUrl: "assets/images/Star 2.png",
                ),
                DetailsRow(
                  title: ' سبب الاغلاق  ',
                  value: 'مرفوضة',
                  imageUrl: "assets/images/offffff.png",
                ),
              ],
            ),

            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.grey[400],
                  ),
                  child: Text(
                    "لم يتم نشره",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "\$ 10.000",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
