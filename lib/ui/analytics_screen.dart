import 'package:flutter/material.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class AnalyticsUi extends StatefulWidget {
  const AnalyticsUi({Key key}) : super(key: key);

  @override
  _AnalyticsUiState createState() => _AnalyticsUiState();
}

class _AnalyticsUiState extends State<AnalyticsUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QUINN'),
          backgroundColor: AppColors.themeOrangeColor,
        ),
        body: body(),
      ),
    );
  }

 Widget body() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        height: MediaQuery.of(context).size.height*0.3,
        width: MediaQuery.of(context).size.width,
        child: SfCartesianChart(),
      ),
    );
 }
}

