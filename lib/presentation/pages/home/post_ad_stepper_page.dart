import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/home/thank_you_page.dart';
import 'package:a3lnha/presentation/widgets/auth/text_form_with_label.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PostAdStepperPage extends StatefulWidget {
  final String title;
  const PostAdStepperPage({super.key, required this.title});

  @override
  State<PostAdStepperPage> createState() => _PostAdStepperPageState();
}

class _PostAdStepperPageState extends State<PostAdStepperPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> _steps = ['التفاصيل', 'المواصفات', 'الصور'];

  void _next() {
    if (_currentIndex < _steps.length - 1) {
      setState(() => _currentIndex++);
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_steps.length, (index) {
        final isSelected = index == _currentIndex;
        return Row(
          children: [
            CircleAvatar(
              radius: isSelected ? 16.r : 14.r,
              backgroundColor: isSelected
                  ? AppColors.darkBlue
                  : Colors.grey[300],
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(_steps[index], style: TextStyle(fontSize: 12.sp)),
          ],
        );
      }),
    );
  }

  Widget _buildBottomNav() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: _currentIndex == _steps.length - 1 ? 'نشر' : 'التالي',
              onTap: _currentIndex == _steps.length - 1
                  ? () {
                      context.push(ThankYouPage());
                    }
                  : _next,
            ),
          ),
          const SizedBox(width: 10),

          _currentIndex > 0
              ? Expanded(
                  child: GestureDetector(
                    onTap: _back,
                    child: Container(
                      width: double.infinity,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "السابقة",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "الغاء",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.title),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildStepIndicator(),
          const Divider(),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [DetailsPage(), SpecsPage(), ContactPage()],
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController locatiobController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  int selectedState = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(8.r),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormWithLabel(
              hintText: "اسم المنتج",
              controller: nameController,
              keyboardType: TextInputType.name,
              obscureText: false,
              labelText: "اسم الإعلان",
            ),
            SizedBox(height: 10.h),
            TextFormWithLabel(
              hintText: "موقع",
              controller: locatiobController,
              keyboardType: TextInputType.streetAddress,
              obscureText: false,
              labelText: "موقع",
            ),
            SizedBox(height: 10.h),
            TextFormWithLabel(
              hintText: "سعر",
              controller: priceController,
              keyboardType: TextInputType.number,
              obscureText: false,
              labelText: "سعر",
            ),
            SizedBox(height: 10.h),
            TextFormWithLabel(
              hintText: "وصف",
              maxlines: 3,
              controller: descController,
              keyboardType: TextInputType.text,
              obscureText: false,
              labelText: "وصف",
            ),
            SizedBox(height: 15.h),
            Text("حالة"),
            SizedBox(height: 10.h),

            Row(
              children: [
                ProductStateWidget(
                  onTap: () {
                    setState(() {
                      selectedState = 0;
                    });
                  },
                  stateNum: 0,
                  selectedState: selectedState,
                ),
                SizedBox(width: 10.w),
                ProductStateWidget(
                  onTap: () {
                    setState(() {
                      selectedState = 1;
                    });
                  },
                  stateNum: 1,
                  selectedState: selectedState,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            TextFormWithLabel(
              hintText: "نوع القطع",
              controller: descController,
              keyboardType: TextInputType.text,
              obscureText: false,
              labelText: "نوع القطع",
            ),
          ],
        ),
      ),
    );
  }
}

class ProductStateWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int stateNum;
  final int selectedState;
  const ProductStateWidget({
    super.key,
    required this.onTap,
    required this.stateNum,
    required this.selectedState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: selectedState == stateNum
              ? AppColors.darkBlue
              : Colors.grey[200],
        ),
        child: Center(
          child: Text(
            stateNum == 0 ? "جديد" : "مستخدم",
            style: TextStyle(
              color: stateNum == selectedState ? Colors.white : Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SpecsPage extends StatelessWidget {
  final TextEditingController useController = TextEditingController();
  final TextEditingController specsController = TextEditingController();

  SpecsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(8.r),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormWithLabel(
                hintText: "الاستخدام المقصود",
                controller: useController,
                keyboardType: TextInputType.text,
                obscureText: false,
                labelText: "الاستخدام المقصود",
              ),
              SizedBox(height: 15.h),
              TextFormWithLabel(
                hintText: "المواصفات العامة",
                controller: specsController,
                keyboardType: TextInputType.text,
                obscureText: false,
                labelText: "المواصفات العامة",
                maxlines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<String> imageUrls = [
    "https://img.freepik.com/free-photo/3d-rendering-loft-luxury-living-room-with-bookshelf_105762-2104.jpg",
    "https://img.freepik.com/free-photo/chic-modern-luxury-aesthetics-style-living-room-blue-tone_53876-125839.jpg",
    "https://img.freepik.com/free-photo/3d-rendering-loft-luxury-living-room-with-bookshelf_105762-2104.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(8.r),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("رفع ملفات"),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 4,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  strokeWidth: 1,
                  color: AppColors.darkBlue,
                  dashPattern: [10, 5],
                  radius: Radius.circular(8.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 30.r,
                        // ignore: deprecated_member_use
                        backgroundColor: HexColor("00CBFF").withOpacity(0.1),
                        child: CircleAvatar(
                          radius: 26.r,
                          backgroundColor: AppColors.darkBlue,
                          child: Image.asset(
                            "assets/images/cloud-upload.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "أختر ملف للرفع",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  var image = imageUrls[index];
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(image),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            imageUrls.removeAt(index);
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.darkBlue,
                          radius: 12.r,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
