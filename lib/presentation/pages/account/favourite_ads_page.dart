import 'package:a3lnha/presentation/pages/account/on_air_ads_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class FavouriteAdsPage extends StatelessWidget {
  final String title;
  const FavouriteAdsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: title),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return AccountAdWidget(isFavourite: true);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: 7,
      ),
    );
  }
}
