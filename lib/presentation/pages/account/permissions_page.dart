import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "الأذونات"),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            PermissionsWidget(
              title: 'إذن إشعارات الهاتف المحمول المستعملة والجديدة',
              subTitle: '',
            ),
            Divider(thickness: 2, height: 40.h, color: Colors.grey[300]),
            PermissionsWidget(
              title: "معلومات قراءة الرسالة",
              subTitle:
                  'يمكن للأشخاص الذين قاموا بتشغيل إشعارات قراءة الرسائل معرفة ما إذا كانت رسائلهم قد تمت قراءتها أثناء مراسلة بعضهم البعض. إذا كنت لا تريد إرسال هذه المعلومات إلى الشخص الذي تراسله، فيمكنك إيقاف تشغيل هذا الإعداد. إذا قمت بإيقاف تشغيل هذا الإعداد، فلن تتمكن من رؤية إشعارات القراءة للرسائل التي ترسلها.',
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionsWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  const PermissionsWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  State<PermissionsWidget> createState() => _PermissionsWidgetState();
}

class _PermissionsWidgetState extends State<PermissionsWidget> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 50.w),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                widget.subTitle,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Switch(
          activeColor: Colors.white,
          activeTrackColor: AppColors.darkBlue,
          inactiveTrackColor: Colors.grey,
          value: isOn,
          onChanged: (v) {
            setState(() {
              isOn = v;
            });
          },
        ),
      ],
    );
  }
}
