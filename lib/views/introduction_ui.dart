// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables

import 'package:thailand_province_project/views/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionUI extends StatefulWidget {
  const IntroductionUI({super.key});

  @override
  State<IntroductionUI> createState() => _IntroductionUIState();
}

class _IntroductionUIState extends State<IntroductionUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange[100],
      body: IntroductionScreen(
        autoScrollDuration: 10000,
        infiniteAutoScroll: true,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: Text(
              'อุทยานแห่งชาติหมู่เกาะอ่างทอง',
              style: GoogleFonts.kanit(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            image: Image.asset('assets/images/sni4.jpg'),
            bodyWidget: Text(
              'เมืองร้อยเกาะ',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'อุทยานแห่งชาติเขาสก',
              style: GoogleFonts.kanit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            image: Image.asset('assets/images/sni3.jpg'),
            bodyWidget: Text(
              'เงาะอร่อย',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'เขื่อนเชี่ยวหลาน',
              style: GoogleFonts.kanit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            image: Image.asset('assets/images/sni2.jpg'),
            bodyWidget: Text(
              'หอยใหญ่',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'หาดริ้น',
              style: GoogleFonts.kanit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            image: Image.asset('assets/images/sni5.jpg'),
            bodyWidget: Text(
              'ไข่แดง',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'วัดพระใหญ่',
              style: GoogleFonts.kanit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            image: Image.asset('assets/images/sni6.jpg'),
            bodyWidget: Text(
              'แหล่งธรรมะ',
              style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        showSkipButton: true,
        skip: Text(
          'ข้าม',
          style: GoogleFonts.kanit(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        onSkip: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUI(),
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: Size(
            MediaQuery.of(context).size.width * 0.025,
            MediaQuery.of(context).size.height * 0.025,
          ),
          color: Colors.grey,
          activeSize: Size(
            MediaQuery.of(context).size.width * 0.055,
            MediaQuery.of(context).size.height * 0.025,
          ),
          activeColor: Colors.orange,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: Colors.orange,
        ),
        nextFlex: 0,
        done: Text(
          'เริ่มต้น',
          style: GoogleFonts.kanit(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        onDone: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUI(),
          ),
        ),
      ),
    );
  }
}
