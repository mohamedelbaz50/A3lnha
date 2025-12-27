import 'package:a3lnha/core/styles/colors.dart';
import 'package:a3lnha/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to login screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.darkBlue,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 150.w,
                height: 160.h,
              ),
            ),
            Positioned(
              bottom: 50.h,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Aalenha.com",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  Text(
                    "بيع - اشتري - استأجر - اكتشف",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
