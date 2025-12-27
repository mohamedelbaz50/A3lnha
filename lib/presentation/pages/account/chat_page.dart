import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/presentation/pages/account/on_air_ads_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "اسم المالك",
        isChat: true,
        onTap: () {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay =
              Overlay.of(context).context.findRenderObject() as RenderBox;

          final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(Offset.zero, ancestor: overlay),
              button.localToGlobal(Offset.zero, ancestor: overlay),
            ),
            Offset.zero & overlay.size,
          );

          showMenu(
            context: context,
            position: position.shift(const Offset(-10, 50)), // adjust position
            color: const Color(0xFF0A3B78),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            items: [
              _buildMenuItem(1, "حذف جميع الرسائل", Icons.delete_outline),
              _buildMenuItem(2, "الإبلاغ", Icons.volume_off_outlined),
              _buildMenuItem(3, "الحظر", Icons.visibility_off_outlined),
            ],
          ).then((value) {
            if (value == 1) {
              print("حذف جميع الرسائل");
            } else if (value == 2) {
              print("الإبلاغ");
            } else if (value == 3) {
              print("الحظر");
            }
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            AccountAdWidget(isFavourite: true),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 35.w,
                        vertical: 15.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.darkBlue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/مايك 1.png",
                            width: 60.w,
                            height: 50.h,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            '⚠️ تنبيه هام',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),

                            textAlign: TextAlign.center,
                          ),
                          Text(
                            " نود أن نلفت انتباهكم إلى أن جميع عمليات البيع والشراء تتم بشكل مباشر بين البائع والمشتري، دون أي تدخل من إدارة التطبيق.  لذا، يُرجى توخي الحذر والتأكد من مصداقية الطرف الآخر قبل إتمام أي عملية. إن استخدامك للتطبيق يعني موافقتك على أن التعامل يتم على مسؤوليتك الشخصية بالكامل.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ChatBubble(isMe: true),
                  ChatBubble(isMe: false),
                  ChatBubble(isMe: true),
                  ChatBubble(isMe: false),
                  ChatBubble(isMe: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(0),
                        filled: true,
                        hint: Text(
                          "اكتب هنا...",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Otline.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        "assets/images/folder.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        "assets/images/add image.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildMenuItem(int value, String text, IconData icon) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
            ),
          ),
          const Icon(Icons.arrow_back_ios, color: Colors.white, size: 14),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  const ChatBubble({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          right: isMe ? 20.w : MediaQuery.sizeOf(context).width / 4,
          left: isMe ? MediaQuery.sizeOf(context).width / 4 : 0,
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: !isMe ? Radius.circular(25.r) : Radius.circular(0),
            topLeft: isMe ? Radius.circular(25.r) : Radius.circular(0),
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
          color: isMe ? AppColors.darkBlue : Colors.white,
        ),
        child: Text(
          "لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. تدافعت عليه لعمل كتاب نموذجي. لقد نجا .",
          style: TextStyle(
            fontSize: 14.sp,
            color: isMe ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
