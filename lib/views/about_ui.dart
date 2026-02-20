

import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
              ),
              Text(
                'Body Healt Calculator',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40.0),
              Text(
                'คำนวนหาค่าดัชนีมวลกาย (BMI)',
              ),
              SizedBox(height: 30.0),
              Text(
                'คำนวนหาค่าแคลอรี่ที่ร่างกายต้องการต่อวัน (BMR)',
              ),
              SizedBox(height: 120.0),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/250px-Logosau-02.png',
                width: 80,
                height: 80,
              ),
              Text('Deverloped By 0xFFFFFFFF 2026'),
            ],
          ),
        ),
      ),
    );
  }
}