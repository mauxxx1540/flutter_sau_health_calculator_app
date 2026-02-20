import 'package:flutter/material.dart';
 
class BmiUi extends StatefulWidget {
  const BmiUi({super.key});
 
  @override
  State<BmiUi> createState() => _BmiUiState();
}
 
class _BmiUiState extends State<BmiUi> {
  //สร้างตัวควบคุม TextField
  TextEditingController weighCtrl = TextEditingController();
  TextEditingController heighCtrl = TextEditingController();
 
  //สร้างตัวแปรเก็บค่า BMI และการแปลผล
  double bmiValue = 0;
  String bmiResult = 'การแปลผล';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 50.0,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 140.0,
                  height: 140.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'น้ำหนัก (Kg.)',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: weighCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'กรุณากรอกน้ำหนัก'),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: heighCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'กรุณากรอกส่วนสูง'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //validate input
                    if (weighCtrl.text.isEmpty || heighCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณาป้อนน้ำหนักส่วนสูงให้ครบ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
 
                      return;
                    }
 
                    //คำนวณ BMI
                    double w = double.parse(weighCtrl.text);
                    double h = double.parse(heighCtrl.text);
                    double bmi = w / ((h / 100) * (h / 100));
                    setState(() {
                      bmiValue = bmi;
                    });
 
                    //แปลผล
                    setState(() {
                      if (bmi < 18.5) {
                        bmiResult = 'ผอมไป';
                      } else if (bmi < 22.9) {
                        bmiResult = 'หุ่นปกติ';
                      } else if (bmi < 24.9) {
                        bmiResult = 'เริ่มอ้วน';
                      } else if (bmi < 29.9) {
                        bmiResult = 'โรคอ้วนระยะที่ 1';
                      } else if (bmi < 39.9) {
                        bmiResult = 'โรคอ้วนระยะที่ 2';
                      } else {
                        bmiResult = 'เตรียมตุย....T-T';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weighCtrl.clear();
                      heighCtrl.clear();
                      bmiValue = 0;
                      bmiResult = 'การแปลผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiValue.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}