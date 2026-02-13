import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/home_ui.dart';
 
class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});
 
  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}
 
class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // โค้ดหน่วงเวลาหน้าจอ พอครบกำหนดเวลาให้ทำอะไรก็ได้แล้วแต่ต้องการ
    Future.delayed(
        // เวลาที่หน่วง 3 วิ
        Duration(seconds: 3),
 
        // พอครบเวลาให้เปิดไปหน้าจอ Home UI แบบย้อนกลับไม่ได้
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUi(),
        ),
      );
    });
 
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Text(
              'Body Healt Calculator',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}