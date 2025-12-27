import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/account/favourite_ads_page.dart';
import 'package:a3lnha/presentation/pages/account/help_page.dart';
import 'package:a3lnha/presentation/pages/account/my_account_page.dart';
import 'package:a3lnha/presentation/pages/account/seller_profile_page.dart';
import 'package:a3lnha/presentation/pages/home/ad_details_page.dart';
import 'package:a3lnha/presentation/pages/home/category_page.dart';
import 'package:a3lnha/presentation/pages/home/notification_page.dart';
import 'package:a3lnha/presentation/pages/home/post_ad_stepper_page.dart';
import 'package:a3lnha/presentation/pages/home/create_ad_page.dart';
import 'package:a3lnha/presentation/pages/search/search_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _drawerSlide;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _drawerSlide = Tween<Offset>(
      begin: Offset(2.0, 0.0), // completely offscreen to the left
      end: Offset(0.0, 0.0), // fully visible
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleDrawer() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text("هل تريد الخروج من التطبيق؟"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("لا"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("نعم"),
              ),
            ],
          ),
        );

        return shouldExit ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          leading: IconButton(
            onPressed: () {
              _toggleDrawer();
            },
            icon: Image.asset(
              "assets/images/Left.png",
              width: 32.w,
              height: 32.h,
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.push(HelpPage());
                    },
                    icon: Image.asset(
                      "assets/images/ix_support.png",
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.push(CreateAdPage());
                },
                child: Image.asset(
                  "assets/images/مايك 1.png",
                  width: 55.w,
                  height: 44.h,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.push(NotificationPage());
                    },
                    icon: Image.asset(
                      "assets/images/bell.png",
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(SellerProfilePage());
                    },
                    icon: Image.asset(
                      "assets/images/Cart.png",
                      width: 32.w,
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 3.8,

                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 60.h,
                          ),
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height / 5.2,
                          color: AppColors.darkBlue,
                        ),
                        Positioned(
                          // This controls how much the card overlaps the blue header
                          left: 20,
                          right: 20,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height / 4.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(
                                    0,
                                    4,
                                  ), // changes position of shadow
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "ابدأ الإعلان",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        "assets/images/Icon Left.png",
                                        width: 20.w,
                                        height: 20.h,
                                      ),

                                      hintText: "المكان. الموقع",
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 0.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),

                                  CustomButton(
                                    text: "بحث",
                                    onTap: () {
                                      context.push(SearchPage());
                                    },
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 0.h,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListView(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              children: [
                                DrawerRow(
                                  isPostAd: false,
                                  title: 'العقارات',
                                  subTitle: 'سكني، تجاري، أرض، إسكان ...',
                                  imageUrl:
                                      'assets/images/material-symbols-light_real-estate-agent-outline.png',
                                  backgroundColor: 'FFCA57',
                                ),
                                DrawerRow(
                                  isPostAd: false,
                                  title: 'المركبات',
                                  subTitle:
                                      'السيارات، الطرق الوعرة، سيارات الدفع الرباعي',
                                  imageUrl:
                                      'assets/images/fluent_vehicle-car-20-regular.png',
                                  backgroundColor: 'FF7D7D',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'قطع غيار المركبات',
                                  subTitle: 'معدات السيارات والدراجات النارية',
                                  imageUrl: 'assets/images/carbon_tool-kit.png',
                                  backgroundColor: '84FF9B',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title:
                                      'العناصر المستعملة والعلامة التجارية الجديدة',
                                  subTitle:
                                      'أجهزة الكمبيوتر والهواتف المحمولة، كاليفورنيا...',
                                  imageUrl:
                                      'assets/images/weui_shop-outlined.png',
                                  backgroundColor: '4A90E2',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'الآلات',
                                  subTitle: 'الآلات الزراعية والمعدات الثقيلة',
                                  imageUrl:
                                      'assets/images/healthicons_machinery-outline.png',
                                  backgroundColor: '7B61FF',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'خدمات',
                                  subTitle:
                                      'الإصلاحات الداخلية والديكور والخدمات اللوجستية',
                                  imageUrl: 'assets/images/tabler_paint.png',
                                  backgroundColor: '2ECC71',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'مدرسون',
                                  subTitle:
                                      'المدرسة الثانوية والكلية والتعليم الابتدائي',
                                  imageUrl:
                                      'assets/images/solar_book-outline.png',
                                  backgroundColor: 'FFA500',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'وظائف',
                                  subTitle: 'المحاسبة والمالية والمصرفية،',
                                  imageUrl:
                                      'assets/images/hugeicons_job-search.png',
                                  backgroundColor: 'E74C3C',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'مساعدة في المنزل',
                                  subTitle: 'المربيات والممرضات، المريض',
                                  imageUrl:
                                      'assets/images/ph_baby-carriage-duotone.png',
                                  backgroundColor: '1ABC9C',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'الحيوانات الأليفة والماشية',
                                  subTitle:
                                      'الحيوانات الأليفة, أسماك الزينة, مستلزمات,',
                                  imageUrl:
                                      'assets/images/ph_baby-carriage-duotone.png',
                                  backgroundColor: 'F1C40F',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'إعلانات آخر ٤٨ ساعة',
                                  subTitle: '',
                                  imageUrl: 'assets/images/Group.png',
                                  backgroundColor: 'FF6F61',
                                ),
                                DrawerRow(
                                  isPostAd: false,

                                  title: 'إعلانات العاجل',
                                  subTitle: '',
                                  imageUrl: 'assets/images/Group.png',
                                  backgroundColor: 'A3E4D7',
                                ),
                              ],
                            ),
                            SeeMoreWidget(title: "إعلانات مميزة"),
                            SizedBox(height: 10.h),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8,
                                    crossAxisSpacing: 25.w,
                                    mainAxisSpacing: 16.h,
                                  ),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return SpecialAdWidget();
                              },
                            ),
                            SeeMoreWidget(
                              title: "إعلانات مشابهة لعمليات البحث السابقة",
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return NearbyAdWidget();
                              },
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                            SeeMoreWidget(title: "إعلانات قريبة من موقعك"),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return NearbyAdWidget();
                              },
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                            SeeMoreWidget(title: "أخر اعلانات قمت بزيارتها"),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return NearbyAdWidget();
                              },
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyDrawerWidget(drawerSlide: _drawerSlide),
          ],
        ),
      ),
    );
  }
}

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key, required Animation<Offset> drawerSlide})
    : _drawerSlide = drawerSlide;

  final Animation<Offset> _drawerSlide;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight - 65.h,
      bottom: 0,
      right: 0,
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: SlideTransition(
        position: _drawerSlide,
        child: Material(
          elevation: 8,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                width: double.infinity,
                color: AppColors.darkBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "أعلنها",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DrawerHeaderRow(
                      title: "حسابي",
                      imagePath: "assets/images/Cart.png",
                      onTap: () {
                        context.push(MyAccountPage());
                      },
                    ),
                    SizedBox(height: 12.h),
                    DrawerHeaderRow(
                      title: "نشر إعلان",
                      imagePath: "assets/images/مايك 1.png",
                      onTap: () {
                        context.push(CreateAdPage());
                      },
                    ),
                  ],
                ),
              ),
              DrawerContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerContent extends StatelessWidget {
  final bool isPostAd;
  const DrawerContent({super.key, this.isPostAd = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DrawerRow(
              isPostAd: isPostAd,
              title: 'العقارات',
              subTitle: 'سكني، تجاري، أرض، إسكان ...',
              imageUrl:
                  'assets/images/material-symbols-light_real-estate-agent-outline.png',
              backgroundColor: 'FFCA57',
            ),
            DrawerRow(
              isPostAd: isPostAd,
              title: 'المركبات',
              subTitle: 'السيارات، الطرق الوعرة، سيارات الدفع الرباعي',
              imageUrl: 'assets/images/fluent_vehicle-car-20-regular.png',
              backgroundColor: 'FF7D7D',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'قطع غيار المركبات',
              subTitle: 'معدات السيارات والدراجات النارية',
              imageUrl: 'assets/images/carbon_tool-kit.png',
              backgroundColor: '84FF9B',
            ),
            DrawerRow(
              isPostAd: isPostAd,
              title: 'العناصر المستعملة و العلامة التجارية الجديدة',
              subTitle: 'أجهزة الكمبيوتر والهواتف المحمولة، كاليفورنيا...',
              imageUrl: 'assets/images/weui_shop-outlined.png',
              backgroundColor: '4A90E2',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'الآلات',
              subTitle: 'الآلات الزراعية والمعدات الثقيلة',
              imageUrl: 'assets/images/healthicons_machinery-outline.png',
              backgroundColor: '7B61FF',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'خدمات',
              subTitle: 'الإصلاحات الداخلية والديكور والخدمات اللوجستية',
              imageUrl: 'assets/images/tabler_paint.png',
              backgroundColor: '2ECC71',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'مدرسون',
              subTitle: 'المدرسة الثانوية والكلية والتعليم الابتدائي',
              imageUrl: 'assets/images/solar_book-outline.png',
              backgroundColor: 'FFA500',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'وظائف',
              subTitle: 'المحاسبة والمالية والمصرفية،',
              imageUrl: 'assets/images/hugeicons_job-search.png',
              backgroundColor: 'E74C3C',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'مساعدة في المنزل',
              subTitle: 'المربيات والممرضات، المريض',
              imageUrl: 'assets/images/ph_baby-carriage-duotone.png',
              backgroundColor: '1ABC9C',
            ),
            DrawerRow(
              isPostAd: isPostAd,

              title: 'الحيوانات الأليفة والماشية',
              subTitle: 'الحيوانات الأليفة, أسماك الزينة, مستلزمات,',
              imageUrl: 'assets/images/ph_baby-carriage-duotone.png',
              backgroundColor: 'F1C40F',
            ),
            !isPostAd
                ? DrawerRow(
                    isPostAd: isPostAd,

                    title: 'إعلانات آخر ٤٨ ساعة',
                    subTitle: '',
                    imageUrl: 'assets/images/Group.png',
                    backgroundColor: 'FF6F61',
                  )
                : SizedBox(),
            !isPostAd
                ? DrawerRow(
                    isPostAd: isPostAd,

                    title: 'إعلانات العاجل',
                    subTitle: '',
                    imageUrl: 'assets/images/Group.png',
                    backgroundColor: 'A3E4D7',
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String backgroundColor;
  final bool isPostAd;

  const DrawerRow({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.backgroundColor,
    this.isPostAd = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isPostAd
            ? context.push(PostAdStepperPage(title: title))
            : context.push(CategoryPage(title: title));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: HexColor(backgroundColor),
                      child: Image.asset(imageUrl, width: 24.w, height: 24.h),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            subTitle,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.sp,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.darkBlue,
                  size: 12.sp,
                ),
              ],
            ),
            SizedBox(height: 15.w),
            Container(
              width: double.infinity,
              height: 1.5.h,
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerHeaderRow extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  const DrawerHeaderRow({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 40.w, height: 40.h),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class NearbyAdWidget extends StatelessWidget {
  const NearbyAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AdDetailsPage());
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/analog-landscape-city-with-buildings_23-2149661456.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("جاجا مادا بيلبورد", style: TextStyle(fontSize: 14.sp)),
                LocationWidget(),
                Text(
                  "\$ 10.000",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  final bool isTime;
  const LocationWidget({super.key, this.isTime = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          isTime
              ? "assets/images/tdesign_time.png"
              : "assets/images/location-01.png",
          width: 16.w,
          height: 16.h,
        ),
        Text(
          isTime ? "منذ ساعة" : "سوراكارتا، جاوا تينجال",
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class SpecialAdWidget extends StatefulWidget {
  const SpecialAdWidget({super.key});

  @override
  State<SpecialAdWidget> createState() => _SpecialAdWidgetState();
}

class _SpecialAdWidgetState extends State<SpecialAdWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AdDetailsPage());
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 156.w,
                  height: 156.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-photo/view-electronic-product-balancing-podium_23-2150141319.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: CircleAvatar(
                    radius: 20.r,
                    // ignore: deprecated_member_use
                    backgroundColor: Colors.black.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text("ماك بوك برو 14"),
          ],
        ),
      ),
    );
  }
}

class SeeMoreWidget extends StatelessWidget {
  final String title;

  const SeeMoreWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push(FavouriteAdsPage(title: title));
          },
          child: Row(
            children: [
              Text(
                "رؤية الكل",
                style: TextStyle(color: AppColors.darkBlue, fontSize: 12.sp),
              ),
              SizedBox(width: 5.w),
              Image.asset(
                "assets/images/arrow-right-01.png",
                width: 16.w,
                height: 16.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
