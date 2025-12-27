import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/helpers/extentions.dart';
import 'package:a3lnha/presentation/pages/home/ad_details_page.dart';
import 'package:a3lnha/presentation/pages/home/home_page.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_appbar.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_button.dart';
import 'package:a3lnha/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();

  final List<String> types = ["العقارات", "السيارات"];
  final List<String> currencies = ["دولار أمريكي", "ريال سعودي"];
  final List<String> chipLabels = [
    "آخر 3 أيام",
    "آخر 24 ساعة",
    "الجميع",
    "آخر 7 أيام",
    "آخر 30 يومًا",
  ];
  final List<String> filterBy = [
    "الصلة",
    "أعلى سعر",
    "أدنى سعر",
    "الأقرب",
    "تصاعدي حسب التاريخ",
    "تنازليا حسب التاريخ",
    "أعلى سعر",
    "حسب العنوان (ي-أ)",
    "حسب العنوان (أ-ي)",
  ];
  int? selectedChipIndex;
  int? selectedfilterIndex;
  String? selectedApperance;

  String? selectedtype;
  String? selectedCurrency;
  SfRangeValues _values = SfRangeValues(40.0, 80.0);
  List<bool> checked = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "نتيجة البحث"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.infinity,
            color: AppColors.darkBlue,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "المكان أو الموقع أو اسم اللوحة الإعلانية",
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _openFilterSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/sliders-horizontal.png",
                            width: 20.w,
                            height: 25.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    FilterWidget(
                      title: "فرز حسب",
                      onTap: () {
                        _openFilterBySheet(context);
                      },
                    ),
                    SizedBox(width: 10.w),
                    FilterWidget(
                      title: "مظهر",
                      onTap: () {
                        _openApperanceSheet(context);
                      },
                    ),
                    Spacer(),
                    Container(
                      width: 75.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "حفظ البحث",
                          style: TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "426 نتيجة متاحة",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return SearchAdWidget();
              },
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 30.h, thickness: 1.5);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(String label, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: checked[index],
          onChanged: (value) {
            setState(() {
              checked[index] = value!;
            });
          },
        ),
        SizedBox(width: 10), // Spacer between checkbox and text
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "فلتر",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "فئة",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        DropdownButtonFormField<String>(
                          value: selectedtype,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                // ignore: deprecated_member_use
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            labelText: "العقارات",
                            border: OutlineInputBorder(),
                          ),
                          items: types.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setModalState(() {
                              selectedtype = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "بحث بالقرب مني",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "0.1 كم",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "كل المسافة",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        SfRangeSlider(
                          min: 0.0,
                          max: 100.0,
                          values: _values,
                          interval: 20,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (SfRangeValues values) {
                            setState(() {
                              _values = values;
                            });
                          },
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "سعر",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                hintText: 'على الأقل',
                                controller: minController,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                              ),
                            ),
                            SizedBox(
                              width: 40.h,
                              child: Center(child: Text("-")),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                hintText: 'على الأكثر',
                                controller: maxController,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        DropdownButtonFormField<String>(
                          value: selectedCurrency,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                // ignore: deprecated_member_use
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            labelText: "دولار أمريكي",
                            border: OutlineInputBorder(),
                          ),
                          items: currencies.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setModalState(() {
                              selectedCurrency = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "تاريخ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Wrap(
                          spacing: 8, // space between chips
                          children: List.generate(chipLabels.length, (index) {
                            return ChoiceChip(
                              label: Text(chipLabels[index]),
                              selected: selectedChipIndex == index,
                              selectedColor:
                                  Colors.blue, // background when selected
                              backgroundColor: Colors
                                  .grey[300], // background when not selected
                              labelStyle: TextStyle(
                                color: selectedChipIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              onSelected: (bool selected) {
                                setModalState(() {
                                  selectedChipIndex = selected ? index : null;
                                });
                              },
                            );
                          }),
                        ),
                        Text(
                          "موقع",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildCheckbox("كل المدينة", 0),
                              buildCheckbox("بالي", 1),
                              buildCheckbox("بانتن", 2),
                              buildCheckbox("بنجكولو", 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "آحرون",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              buildCheckbox("إعلانات مع فيديو", 4),
                              buildCheckbox("إعلانات بصور 360 درجة", 5),
                              buildCheckbox("الإعلانات مع الخريطة", 6),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: "مسح التصفية",
                                      onTap: () {},
                                      backgroundColor: Colors.grey[200],
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Expanded(
                                    child: CustomButton(
                                      text: "تطبيق الفلتر",
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _openFilterBySheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.all(15.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "فرز حسب",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Wrap(
                    spacing: 8, // space between chips
                    children: List.generate(filterBy.length, (index) {
                      return ChoiceChip(
                        label: Text(filterBy[index]),
                        selected: selectedfilterIndex == index,
                        selectedColor: Colors.blue, // background when selected
                        backgroundColor:
                            Colors.grey[300], // background when not selected
                        labelStyle: TextStyle(
                          color: selectedfilterIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        onSelected: (bool selected) {
                          setModalState(() {
                            selectedfilterIndex = selected ? index : null;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "مسح التصفية",
                          onTap: () {},
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: CustomButton(text: "تطبيق الفلتر", onTap: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openApperanceSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.all(15.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مظهر",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<String>(
                        title: const Text("على الخريطة"),
                        value: "على الخريطة",
                        groupValue: selectedApperance,
                        onChanged: (value) {
                          setModalState(() {
                            selectedApperance = value;
                          });
                          setState(() {
                            selectedApperance = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text("قائمة"),
                        value: "قائمة",
                        groupValue: selectedApperance,
                        onChanged: (value) {
                          setModalState(() {
                            selectedApperance = value;
                          });
                          setState(() {
                            selectedApperance = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "مسح التصفية",
                          onTap: () {},
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: CustomButton(text: "تطبيق الفلتر", onTap: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class FilterWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const FilterWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Icon(Icons.arrow_drop_down, color: Colors.white),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SearchAdWidget extends StatelessWidget {
  SearchAdWidget({super.key});
  final containerKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showPopup(BuildContext context, GlobalKey key) {
    // Get the container position
    final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy - 40, // show above container
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 18.sp),
                SizedBox(width: 6),
                Text(
                  'عرض على الخريطة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto close after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: containerKey,
      onLongPress: () {
        _showPopup(context, containerKey);
      },
      onTap: () {
        context.push(AdDetailsPage());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/3d-rendering-loft-luxury-living-room-with-bookshelf-near-bookshelf_105762-2224.jpg",
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationWidget(isTime: true),
                Text("جاجا مادا بيلبورد", style: TextStyle(fontSize: 14.sp)),
                LocationWidget(),
              ],
            ),

            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Image.asset("assets/images/solar_like-broken.png"),
                      ],
                    ),
                    SizedBox(width: 15.w),
                    Row(
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Image.asset("assets/images/cahtt.png"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  "\$ 10.000",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.lightBlue,
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
