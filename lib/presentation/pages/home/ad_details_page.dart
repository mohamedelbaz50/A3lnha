import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/chat_page.dart';
import 'package:a3lnha/presentation/pages/account/seller_profile_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:a3lnha/presentation/widgets/shared/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class AdDetailsPage extends StatefulWidget {
  const AdDetailsPage({super.key});

  @override
  State<AdDetailsPage> createState() => _AdDetailsPageState();
}

class _AdDetailsPageState extends State<AdDetailsPage> {
  var pageController = PageController();
  final TextEditingController newPriceController = TextEditingController();

  int selectedTypeNumber = 1;
  void _showNewPriceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Circular border
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'التفاوض على السعر',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'قم باضافة السعر المراد و ارساله الى التاجر',
                  style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormWithLabel(
                        hintText: "السعر الجديد",
                        controller: newPriceController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        labelText: "السعر الجديد",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "ارسال",
                        onTap: () {
                          context.pop();
                          showToast(message: "تم ارسال طلب التفاوض");
                        },
                        backgroundColor: AppColors.darkBlue,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Expanded(
                      child: CustomButton(
                        text: "رجوع",
                        onTap: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "تفاصيل الإعلان"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 2.9,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
                          width: MediaQuery.sizeOf(context).width / 1.2,
                          height: MediaQuery.sizeOf(context).height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://img.freepik.com/free-photo/analog-landscape-city-with-buildings_23-2149661456.jpg",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: SwapEffect(
                // ignore: deprecated_member_use
                dotColor: Colors.grey.withOpacity(0.3),
                activeDotColor: AppColors.lightBlue,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                children: [
                  SellerInfoWidget(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "شقق استانا",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        "\$ 10.000",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 40.w),
                      Expanded(
                        child: CustomButton(
                          text: 'التفواض علي السعر',
                          onTap: () {
                            _showNewPriceDialog(context);
                          },
                          backgroundColor: AppColors.darkBlue,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40.w),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdInfoTypeWidget(
                        typeNumber: 1,
                        title: "تفاصيل الإعلان",
                        selectedTypeNumber: selectedTypeNumber,
                        onTap: () {
                          setState(() {
                            selectedTypeNumber = 1;
                          });
                        },
                      ),
                      AdInfoTypeWidget(
                        typeNumber: 2,
                        title: "وصف",
                        selectedTypeNumber: selectedTypeNumber,
                        onTap: () {
                          setState(() {
                            selectedTypeNumber = 2;
                          });
                        },
                      ),
                      AdInfoTypeWidget(
                        typeNumber: 3,
                        title: "موقع",
                        selectedTypeNumber: selectedTypeNumber,
                        onTap: () {
                          setState(() {
                            selectedTypeNumber = 3;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: selectedTypeNumber == 1
                  ? DescView()
                  : selectedTypeNumber == 2
                  ? DescriptionView()
                  : Center(child: Text("Comin Soon ...")),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "وصف",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "مرحبًا بكم في شقق Skyline Haven، حيث تجتمع الفخامة مع الراحة. تبلغ مساحة هذه الشقة المذهلة المكونة من غرفتي نوم وحمامين 1200 قدم مربع. قدم. من مساحة المعيشة المصممة بشكل جميل. بفضل النوافذ الممتدة من الأرض حتى السقف، استمتع بإطلالات خلابة على المدينة من كل غرفة..مرحبًا بك في Skyline Haven Apartments، حيث تجتمع الفخامة مع الراحة. تبلغ مساحة هذه الشقة المذهلة المكونة من غرفتي نوم وحمامين 1200 قدم مربع. قدم. من مساحة المعيشة المصممة بشكل جميل. مع النوافذ الممتدة من الأرض حتى السقف، استمتع بإطلالات خلابة على المدينة من كل غرفة .",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.h),
        ContactRow(),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class DescView extends StatelessWidget {
  const DescView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsRowWidget(title: 'سعر', value: '5 دولار {{نقطة}}000'),
        DetailsRowWidget(title: 'رقم الإعلان', value: '121006850'),
        DetailsRowWidget(title: 'فئة', value: 'تجاري'),
        DetailsRowWidget(title: 'حالة', value: 'للإيجار مخزن ومتجر'),
        DetailsRowWidget(title: 'م2', value: '35'),
        DetailsRowWidget(title: 'عمر البناء', value: '0'),
        DetailsRowWidget(title: 'رقم الفصل والغرفة', value: '2'),
        DetailsRowWidget(title: 'حالة المبنى', value: 'جديد'),
        DetailsRowWidget(title: 'المستحقات', value: '400'),

        ContactRow(),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContactButton(
          text: 'اتصل',
          color: AppColors.darkBlue,
          textColor: Colors.white,
        ),
        ContactButton(
          text: 'أرسل رسالة',
          color: AppColors.yellow,
          textColor: Colors.black,
        ),
      ],
    );
  }
}

class ContactButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const ContactButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ChatPage());
      },
      child: Container(
        width: 160.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const DetailsRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: Colors.grey[600])),
              Text(value),
            ],
          ),
          Divider(thickness: 1.5),
        ],
      ),
    );
  }
}

class AdInfoTypeWidget extends StatelessWidget {
  final int typeNumber;
  final String title;
  final VoidCallback onTap;
  final int selectedTypeNumber;
  const AdInfoTypeWidget({
    super.key,
    required this.typeNumber,
    required this.title,
    required this.onTap,
    required this.selectedTypeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.h),
        width: 100.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: selectedTypeNumber == typeNumber
              ? AppColors.darkBlue
              : Colors.grey[300],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: selectedTypeNumber == typeNumber
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
