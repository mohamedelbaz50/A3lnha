import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MyProductsDealsPage extends StatelessWidget {
  const MyProductsDealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'عروض منتجاتي'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoWidget(),

          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://img.freepik.com/free-photo/analog-landscape-city-with-buildings_23-2149661456.jpg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "جاجا مادا بيلبورد",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: HexColor("26A69A"),
                                ),
                                child: Text(
                                  "منشور",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LocationWidget(),
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
                          SizedBox(height: 5.h),
                          DetailsRow(
                            title: 'اريخ نشر الاعلان',
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
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "عرض من ",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "  أسم المستخدم",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ 9.000",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        AcceptOrRefuseButton(title: 'قبول', color: '208F20'),
                        SizedBox(width: 10.w),
                        AcceptOrRefuseButton(title: 'رفض', color: 'FF0000'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.3,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 7,
            color: AppColors.darkBlue,
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 30.h,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 16.h,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 35.r,
                          backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                          ),
                        ),
                        CircleAvatar(
                          radius: 12.r,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "assets/images/edit.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "اسم المستخدم",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "gmail@gmail.com",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
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

class AcceptOrRefuseButton extends StatelessWidget {
  final String title;
  final String color;
  const AcceptOrRefuseButton({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: HexColor(color),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String title;
  final String value;
  final String imageUrl;
  const DetailsRow({
    super.key,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageUrl, width: 10.w, height: 10.h),
        SizedBox(width: 10.h),
        Text(
          title,
          style: TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 20.h),
        Text(
          value,
          style: TextStyle(
            height: 1.2,
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
