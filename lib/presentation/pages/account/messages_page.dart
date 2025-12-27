import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/chat_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "الرسائل"),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            SearchTextFormField(),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemBuilder: (context, index) {
                  return UserBubbleWidget();
                },
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        focusColor: Colors.grey[200],
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        hoverColor: Colors.grey,
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        hint: Text("بحث", style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class UserBubbleWidget extends StatelessWidget {
  const UserBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ChatPage());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          children: [
            UserAvatar(),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "أثاليا بوتري",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/codicon_check-all.png",
                      width: 15.w,
                      height: 15.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "صباح الخير",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              "اليوم",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://img.freepik.com/free-photo/photo-attractive-smiling-man-with-trendy-hairstyle-positive-look-dressed-fashionable-festive-outfit-stands-against-pink-wall_273609-23540.jpg",
          ),
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }
}
