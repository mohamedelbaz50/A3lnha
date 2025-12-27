import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/payement/choose_payement_page.dart';
import 'package:a3lnha/presentation/pages/payement/hewala_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "المحفظة"),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
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
                      color: AppColors.darkBlue,

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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المحفظة",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/images/wallet.png",
                                  width: 50.w,
                                  height: 50.h,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "المبلغ المتاح حاليا فى المحفظة",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            width: double.infinity,
                            height: 40.h,
                            color: AppColors.yellow,
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    " 149.868 \$",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Image.asset(
                                    "assets/images/hide.png",
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                ],
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
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(HewalaPage());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 28.r,
                                backgroundColor: AppColors.darkBlue,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/wallet.png",
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "اشحن رصيد",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "السجل المالي الأخير",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TransactionWIdget(),
                        TransactionWIdget(),
                        TransactionWIdget(isPlus: false),
                        TransactionWIdget(isPlus: false),
                        TransactionWIdget(),
                        SizedBox(height: 10.h),
                        PaymentMethodWidget(
                          title: 'Master Card',
                          imagePath: 'assets/images/Rectangle 93.png',
                        ),
                        PaymentMethodWidget(
                          title: 'Visa',
                          imagePath: 'assets/images/visa.png',
                        ),
                        SizedBox(height: 30.h),
                      ],
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

class PaymentMethodWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  const PaymentMethodWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.grey),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: HexColor("454545"),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "****6356",
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15.w),
                Image.asset(imagePath, width: 50.w, height: 50.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionWIdget extends StatelessWidget {
  final bool isPlus;
  const TransactionWIdget({super.key, this.isPlus = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  " 14.868 \$",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isPlus ? "+" : "-",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: isPlus ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تحويل رصيد من حواله محليه",

                      style: TextStyle(
                        height: 1.5,
                        fontSize: 14.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "02,15 pm - sep 17, 2022",
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.w),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.darkBlue,
                  child: Image.asset(
                    "assets/images/sss.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(thickness: 1.5),
      ],
    );
  }
}
