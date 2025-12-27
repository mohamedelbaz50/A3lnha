import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isChat;
  VoidCallback? onTap;
  CustomAppbar({
    super.key,
    required this.title,
    this.isChat = false,
    this.onTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      leading: IconButton(
        onPressed: onTap,
        icon: Image.asset("assets/images/Left.png", width: 32.w, height: 32.h),
      ),
      actions: [
        IconButton(
          onPressed: () {
            isChat ? null : context.pop();
          },
          icon: isChat
              ? Image.asset("assets/images/call.png", width: 32.w, height: 32.h)
              : Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
        ),
      ],
    );
  }
}
