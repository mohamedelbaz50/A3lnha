import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/pages/home/ad_details_page.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class OnAirAdsPage extends StatelessWidget {
  const OnAirAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "على الهواء"),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return AccountAdWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: 7,
      ),
    );
  }
}

class AccountAdWidget extends StatelessWidget {
  final bool isPublished;
  final bool isFavourite;
  const AccountAdWidget({
    super.key,
    this.isPublished = true,
    this.isFavourite = false,
  });

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
                SizedBox(height: 8.h),
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
              children: [
                isFavourite
                    ? SizedBox()
                    : Container(
                        padding: EdgeInsets.all(5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: isPublished
                              ? HexColor("26A69A")
                              : Colors.grey[400],
                        ),
                        child: Text(
                          isPublished ? "منشور" : "لم يتم نشره",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
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
