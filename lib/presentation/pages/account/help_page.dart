import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "المساعدة"),
      body: Column(
        children: [
          UserInfoWidget(),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return HelpQuestionItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}

class HelpQuestionItem extends StatelessWidget {
  const HelpQuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        '? Where can I watch ',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Nibh quisque suscipit fermentum netus nulla cras porttitor euismod nulla. Orci, dictumst nec aliquet id ullamcorper venenatis. Fermentum sulla craspor ttitore  ismod nulla. Elit adipiscing proin quis est consectetur. Felis ultricies nisi, quis malesuada sem odio. Potenti nibh natoque amet amet, tincidunt ultricies et. Et nam rhoncus sit nullam diam tincidunt condimentum nullam.',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black45,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
