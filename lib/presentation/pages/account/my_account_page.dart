import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/edit_profile_page.dart';
import 'package:a3lnha/presentation/pages/account/favourite_ads_page.dart';
import 'package:a3lnha/presentation/pages/account/favourite_sellers_page.dart';
import 'package:a3lnha/presentation/pages/account/help_page.dart';
import 'package:a3lnha/presentation/pages/account/messages_page.dart';
import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/pages/account/not_published_ads_page.dart';
import 'package:a3lnha/presentation/pages/account/on_air_ads_page.dart';
import 'package:a3lnha/presentation/pages/home/info_about_app_page.dart';
import 'package:a3lnha/presentation/pages/payement/my_wallet_page.dart';
import 'package:a3lnha/presentation/pages/payement/payment_gateway_page.dart';
import 'package:a3lnha/presentation/pages/account/permissions_page.dart';
import 'package:a3lnha/presentation/pages/account/problems_page.dart';
import 'package:a3lnha/presentation/pages/auth/login_page.dart';
import 'package:a3lnha/presentation/pages/home/notification_page.dart';
import 'package:a3lnha/presentation/pages/payement/quta_pages.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'حسابي'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 4.5,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 60.h,
                  ),
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
                    height: MediaQuery.sizeOf(context).height / 5.5,
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
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اسم المستخدم",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
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
                              SizedBox(height: 5.h),
                              GestureDetector(
                                onTap: () {
                                  context.push(EditProfilePage());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "تحرير الملف الشخصي",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor("030712"),
                                      ),
                                    ),
                                    SizedBox(width: 7.w),
                                    Image.asset(
                                      "assets/images/edit.png",
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "إدارة الإعلانات",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("030712"),
                      ),
                    ),
                    SizedBox(height: 15.w),
                    ProfileContainer(
                      child: Column(
                        children: [
                          ProfileRow(
                            isWithNumber: true,
                            title: "على الهواء",
                            onTap: () {
                              context.push(OnAirAdsPage());
                            },
                          ),
                          Divider(height: 10.h, thickness: 1.5.h),
                          ProfileRow(
                            title: "لم يتم نشره",
                            onTap: () {
                              context.push(NotPublishedAdsPage());
                            },
                            isWithNumber: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "الرسائل والمعلومات",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("030712"),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    ProfileContainer(
                      child: Column(
                        children: [
                          ProfileRow(
                            title: 'رسائل',
                            onTap: () {
                              context.push(MessagesPage());
                            },
                          ),
                          Divider(height: 10.h, thickness: 1.5.h),
                          ProfileRow(
                            title: 'الأذونات',
                            onTap: () {
                              context.push(PermissionsPage());
                            },
                          ),
                          Divider(height: 10.h, thickness: 1.5.h),
                          ProfileRow(
                            title: 'عروض منتجاتي',
                            onTap: () {
                              context.push(MyProductsDealsPage());
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "المفضلة",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("030712"),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "الإعلانات المفضلة",
                        onTap: () {
                          context.push(
                            FavouriteAdsPage(title: "الإعلانات المفضلة"),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "البائععين المفضلين",
                        onTap: () {
                          context.push(FavouriteSellersPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "حسابي",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("030712"),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "معلومات حسابي",
                        onTap: () {
                          context.push(EditProfilePage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),

                    ProfileContainer(
                      child: ProfileRow(
                        title: "بوابة الدفع",
                        onTap: () {
                          context.push(PaymentGatewayPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "الباقات",
                        onTap: () {
                          context.push(QutaPages());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "المحفظة",
                        onTap: () {
                          context.push(MyWalletPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "المساعدة",
                        onTap: () {
                          context.push(HelpPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "الأبلاغ عن مشكلة",
                        onTap: () {
                          context.push(ProblemsPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "الأشعارات",
                        onTap: () {
                          context.push(NotificationPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "أختيار اللغة",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(35.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InDialogButton(
                                        imagePath: "assets/images/arabic.png",
                                        title: 'عربي',
                                        backgroundColor: Colors.white,
                                        textColor: AppColors.darkBlue,
                                        onTap: () {
                                          context.pop();
                                        },
                                      ),
                                      SizedBox(height: 25.h),
                                      InDialogButton(
                                        imagePath: "assets/images/turkey.png",
                                        title: 'Türkçe',
                                        backgroundColor: Colors.white,
                                        textColor: AppColors.darkBlue,
                                        onTap: () {
                                          context.pop();
                                        },
                                      ),
                                      SizedBox(height: 25.h),
                                      InDialogButton(
                                        imagePath: "assets/images/en.png",
                                        title: 'ENGLISH',
                                        backgroundColor: Colors.white,
                                        textColor: AppColors.darkBlue,
                                        onTap: () {
                                          context.pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ProfileContainer(
                      child: ProfileRow(
                        title: "معلومات عن التطبيق",
                        onTap: () {
                          context.push(InfoAboutAppPage());
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          context.pushAndRemoveUntil(LoginPage());
                        },
                        label: Text("تسجيل الخروج"),
                        icon: Image.asset(
                          "assets/images/logout-03.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          textStyle: TextStyle(fontSize: 14.sp),
                        ),
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

class ProfileContainer extends StatelessWidget {
  final Widget child;
  const ProfileContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}

class ProfileRow extends StatelessWidget {
  final bool isWithNumber;
  final String title;
  final VoidCallback onTap;
  const ProfileRow({
    super.key,
    this.isWithNumber = false,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
            isWithNumber
                ? Text("(0)")
                : Icon(Icons.arrow_forward_ios, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
