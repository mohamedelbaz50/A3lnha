import 'package:a3lnha/presentation/pages/account/my_products_deals_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QutaPages extends StatefulWidget {
  const QutaPages({super.key});

  @override
  State<QutaPages> createState() => _QutaPagesState();
}

class _QutaPagesState extends State<QutaPages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> plans = [
    {
      "title": "باقه البداية",
      "titleColor": Colors.white,
      "bgColor": Colors.black87,
      "description": "مناسبة للإعلانات السريعة",
      "price": "\$0",
      "features": ["نشر الإعلان لمدة 30 يوم", "ظهور صورتك في نتائج البحث"],
      "imagePath": 'assets/images/qouta1.jpg',
    },
    {
      "title": "المحترف",
      "titleColor": Colors.white,
      "bgColor": Colors.blue,
      "description": "مناسبة للبائعين النشطين وزيادة المبيعات",
      "price": "\$2",
      "features": [
        "نشر الإعلان لمدة 30 يوم",
        "ظهور صورتك في نتائج البحث",
        "عرض مميز في الصفحة لمدة أسبوع",
        "عنوان بخط عريض مع إطار ملون",
      ],
      "imagePath":
          'assets/images/WhatsApp Image 2025-08-10 at 13.01.42_9ad56da6.jpg',
    },
    {
      "title": "التميز",
      "titleColor": Colors.black,
      "bgColor": Colors.yellow,
      "description": "الأفضل للتجار والمشاريع الكبيرة",
      "price": "\$3",
      "features": [
        "نشر الإعلان لمدة 30 يوم",
        "ظهور صورتك في نتائج البحث",
        "عرض مميز في الصفحة لمدة أسبوع",
        "عنوان بخط عريض مع إطار ملون",
        "دفع أسبوعي (Boost) أولوية في نتائج البحث",
        "شارة مميزة (حساب موثق)",
      ],
      "imagePath":
          'assets/images/WhatsApp Image 2025-08-10 at 13.01.42_f0f50607.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "ملفي الشخصي"),
      body: Column(
        children: [
          UserInfoWidget(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: plans.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final plan = plans[index];
                      return _buildPlanCard(
                        context,
                        title: plan["title"],
                        titleColor: plan["titleColor"],
                        bgColor: plan["bgColor"],
                        description: plan["description"],
                        price: plan["price"],
                        features: List<String>.from(plan["features"]),
                        imagePath: plan["imagePath"],
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    plans.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: _currentPage == index ? 16.w : 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context, {
    required String title,
    required Color titleColor,
    required Color bgColor,
    required String description,
    required String price,
    required List<String> features,
    required String imagePath,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              height: 150.h,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imagePath),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              width: double.infinity,
            ),

            // Features (expand to push button to bottom)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...features.map(
                      (feature) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              feature,
                              style: TextStyle(fontSize: 14.sp),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Price
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                price,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF019861),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تم الاشتراك في خطة $title"),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  "اشترك الآن",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
