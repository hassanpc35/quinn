import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/custom_painter.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // _timer() {
  //   Timer(Duration(seconds: 3), () async {
  //     NavigationService().pushNamedAndRemoveUntil(registrationRoute,
  //         arguments: {'from': 'splash'});
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.67,
              width: double.infinity,
              child: CustomPaint(
                painter: LogoPainter(),
              ),
            ),
            Container(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Column(

                    children: [
                      Text(
                        'QUINN',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Stay Connects',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  RoundedWhiteButton(label: 'START',onClick: (){
                    NavigationService().pushNamedAndRemoveUntil(registrationRoute,
                        arguments: {'from': 'splash'});
                  },),
                ],
              ),
            ),
          ],
        ));
  }
}