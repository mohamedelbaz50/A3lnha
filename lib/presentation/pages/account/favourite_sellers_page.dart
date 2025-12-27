import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/favourite_ads_page.dart';
import 'package:a3lnha/presentation/pages/account/messages_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteSellersPage extends StatelessWidget {
  const FavouriteSellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "البائعين المفضلين"),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchTextFormField(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FavSellerItem();
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavSellerItem extends StatelessWidget {
  const FavSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      title: 'قم بعرض الاعلانات',
                      backgroundColor: AppColors.darkBlue,
                      textColor: Colors.white,
                      onTap: () {
                        context.push(FavouriteAdsPage(title: "اعلانات البائع"));
                      },
                    ),
                    SizedBox(height: 25.h),
                    InDialogButton(
                      title: 'التوجه لحساب التاجر',
                      backgroundColor: AppColors.darkBlue,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                    SizedBox(height: 25.h),
                    InDialogButton(
                      title: 'الحذف من المفضلة',
                      backgroundColor: Colors.white,
                      textColor: AppColors.darkBlue,
                      onTap: () {
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("تم الحذف من المفضله")),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar(),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Text(
                      "أثاليا بوتري",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "شركة *******",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}

class InDialogButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final String? imagePath;
  const InDialogButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkBlue),
          borderRadius: BorderRadius.circular(50.r),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (imagePath != null)
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundImage: AssetImage(imagePath!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
