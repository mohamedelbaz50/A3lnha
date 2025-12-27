// ignore_for_file: deprecated_member_use

import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/change_password_page.dart';
import 'package:a3lnha/presentation/pages/account/delete_acc_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();

  TextEditingController companyDescriptionController = TextEditingController();

  void showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '⚠️ تنبيه هام',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'انت تقوم بحذف حسابك',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),

                      // Buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push(DeleteAccPage());
                            },
                            child: Container(
                              height: 60.h,
                              width: 105.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Text(
                                  "حذف الحساب",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Container(
                              height: 60.h,
                              width: 105.h,
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Text(
                                  "الرجوع",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Top circle icon
                Positioned(
                  top: -30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? selectedgov;
  List<String> saudigovs = [
    "الرياض",
    "مكة المكرمة",
    "المدينة المنورة",
    "القصيم",
    "الشرقية",
    "عسير",
    "تبوك",
    "حائل",
    "الحدود الشمالية",
    "جازان",
    "نجران",
    "الباحة",
    "الجوف",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'ملفي الشخصي'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.3,
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
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.w),
                    padding: EdgeInsets.all(15.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormWithLabel(
                          hintText: "اسمك",
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          labelText: "اسم",
                        ),
                        SizedBox(height: 10.h),
                        TextFormWithLabel(
                          hintText: "your@email.com",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          labelText: "بريد إلكتروني",
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "رقم الهاتف",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        IntlPhoneField(
                          decoration: InputDecoration(
                            hintText: "الرقم",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 12.w,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.1.w,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.1.w,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5.w,
                              ),
                            ),
                          ),
                          initialCountryCode: 'SA',
                          onChanged: (phone) {
                            print(phone.countryISOCode);
                          },
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "المحافظة",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        CustomDropdownFormField(
                          hintText: 'اختر المحافظه',
                          value: selectedgov,
                          items: saudigovs.map((region) {
                            return DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedgov = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "المنطقه",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        CustomDropdownFormField(
                          hintText: 'اختر المنطقه',
                          value: selectedgov,
                          items: saudigovs.map((region) {
                            return DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedgov = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        TextFormWithLabel(
                          hintText: "اسم الشركة",
                          controller: companyNameController,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          labelText: "اسم الشركة ",
                        ),
                        SizedBox(height: 10.h),
                        TextFormWithLabel(
                          hintText: "وصف الشركة",
                          controller: companyDescriptionController,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          labelText: "الوصف ",
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "تغير كلمة السر",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        GestureDetector(
                          onTap: () {
                            context.push(ChangePasswordPage());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.h,
                              horizontal: 15.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: HexColor("#F5F5F5"),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "**********",
                                    style: TextStyle(
                                      color: AppColors.darkBlue,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.push(ChangePasswordPage());
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              showWarningDialog(context);
                            },
                            child: Container(
                              width: 120.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "حذف الحساب",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Image.asset(
                                      "assets/images/Button Link.png",
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(text: "حفظ", onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownFormField extends StatelessWidget {
  final String hintText;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomDropdownFormField({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
        fillColor: Colors.transparent,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.1.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey, width: 0.5.w),
        ),
      ),
      items: items,
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
