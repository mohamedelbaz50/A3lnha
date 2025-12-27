import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/on_air_ads_page.dart';
import 'package:a3lnha/presentation/pages/account/share_profile_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerProfilePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "ملفي الشخصي"),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.2,
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
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SellerInfoWidget(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        width: double.infinity,
                        height: 115.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "هذا النص هو مثال لنص يمكن استبداله في نفس المساحة. لقد تم توليد هذا النص لملء الحقول ب  يمكن تعديل هذا المحتوى لاحقًا بما يتناسب مع محتوى التطبيق أو الموقع.  الهدف من هذا النص هو عرض شكل المكونات داخل الواجهة بدون الاعتماد على محتوى حقيقي.  يرجى عدم اعتبار هذا النص كمحتوى نهائي، حيث سيتم تحديثه لاحقًا بالمعلومات الفعلية.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 2.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AccountAdWidget(isFavourite: true);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 20.h, thickness: 1.5);
                        },
                        itemCount: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4 تقييمات النجوم",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Image.asset(
                            "assets/images/stars.png",
                            width: 100.w,
                            height: 60.h,
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return opinionItem();
                        },
                      ),
                      SizedBox(height: 30.h),
                      TextFormWithLabel(
                        hintText: "التعليق",
                        controller: controller,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        labelText: "كتابة تعليق",
                        maxlines: 6,
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(text: "ارسال", onTap: () {}),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SellerInfoWidget extends StatelessWidget {
  const SellerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.push(SellerProfilePage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/man-portrait_1296-631.jpg",
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "اسـم التاجـــر ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          "assets/images/Group 76649.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: AppColors.darkBlue,
                          child: Text(
                            "8",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "4 نجوم",
                          style: TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          "assets/images/stars.png",
                          width: 60.w,
                          height: 50.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SellerProfileFollowOrShareButton(
                    title: 'متابعة',
                    image: 'assets/images/add account.png',
                    textColor: Colors.white,
                    backgroundColor: AppColors.darkBlue,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تمت متابعة التاجر")),
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  SellerProfileFollowOrShareButton(
                    title: 'مشاركة',
                    image: 'assets/images/share-08.png',
                    textColor: AppColors.darkBlue,
                    backgroundColor: AppColors.yellow,
                    onTap: () {
                      context.push(ShareProfilePage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "يتابع ( 120 )   /  متابعون ( 80 )",
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class opinionItem extends StatelessWidget {
  const opinionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/man-portrait_1296-631.jpg",
                ),
              ),

              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("چارلی کاکس"),
                  Image.asset(
                    "assets/images/stars.png",
                    width: 60.w,
                    height: 30.w,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "من از زمان تحویل و کیفیت کالا کاملا راضی بودم و خرید این کالا رو به شما پیشنهاد میکنم.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SellerProfileFollowOrShareButton extends StatelessWidget {
  final String title;
  final String image;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const SellerProfileFollowOrShareButton({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: backgroundColor,
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(width: 5.w),
              Image.asset(image, width: 15.w, height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
