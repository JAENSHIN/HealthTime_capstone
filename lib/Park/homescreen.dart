import 'package:flutter/material.dart';
import 'loginpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String congestion = '여유'; // '보통'을 '여유'로 변경

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Container(
            width: 350,
            height: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '입·퇴장 시 QR코드를 인식시켜주세요',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
                Text(
                  '회원번호 : $enteredId',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '헬스장 혼잡도',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('여유',
                        style: TextStyle(fontSize: 16, color: Colors.green)),
                    Text('보통',
                        style: TextStyle(fontSize: 16, color: Colors.orange)),
                    Text('혼잡',
                        style: TextStyle(fontSize: 16, color: Colors.red)),
                  ],
                ),
                SizedBox(height: 10),
                _buildBatteryIndicator(congestion),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryIndicator(String congestionStatus) {
    Color color1, color2, color3, color4, color5, color6, color7;

    switch (congestionStatus) {
      case '여유':
        color1 = color2 = Colors.green;
        color3 = color4 = color5 = color6 = color7 = Colors.grey;
        break;
      case '보통':
        color1 = color2 = Colors.green;
        color3 = color4 = color5 = Colors.orange;
        color6 = color7 = Colors.grey;
        break;
      case '혼잡':
        color1 = color2 = Colors.green;
        color3 = color4 = color5 = Colors.orange;
        color6 = color7 = Colors.red;
        break;
      default:
        color1 =
            color2 = color3 = color4 = color5 = color6 = color7 = Colors.grey;
        break;
    }

    return Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIndicator(color1),
          _buildIndicator(color2),
          _buildIndicator(color3),
          _buildIndicator(color4),
          _buildIndicator(color5),
          _buildIndicator(color6),
          _buildIndicator(color7),
        ],
      ),
    );
  }

  Widget _buildIndicator(Color color) {
    return Container(
      width: 35,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
