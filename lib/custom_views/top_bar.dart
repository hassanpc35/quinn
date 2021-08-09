import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quinn/custom_views/my_dialog_boxes.dart';
import 'package:quinn/model/schedule_data_response.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:http/http.dart' as http;
class TopBar extends StatefulWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  List<String> imageList = [
    wifi,
    consumption,
    schedules,
  ];
  List<String> cardTextList = [
    'Strength',
    'Consumption',
    'Schedules',
  ];

  List parsedScheduleList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_scheduleData();

  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children:
      List.generate(3, (index){
        return Center(
          child: GestureDetector(
            child: getCard(imageList[index],cardTextList[index]),
            onTap: () async {
              switch(index){
                case 0:
                  //await showDialog(context: context, builder: (context)=>WifiDialog());
                  break;
                case 1:
                  Text('two');
                  break;
                case 2:
                  await showDialog(barrierDismissible:true,context: context, builder: (context)=>ScheduleDialog());
                  break;

              }
            },
          ),
        );
      })
      ,);
  }

  getCard(String image, String text){
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image,height: 60,width: 60,),
            Text(text),

          ],
        ),
      ),
    );
  }


  // static List<ScheduleDataResponse> scheduleData(String responseBody) {
  //   var scheduleList = json.decode(responseBody) as List<dynamic>;
  //   List<ScheduleDataResponse> schedulesList =
  //   scheduleList.map((model) => ScheduleDataResponse.fromJson(model)).toList();
  //   return schedulesList;
  //
  //   // setState(() {
  //   //   parsedScheduleList = jsonDecode(responseBody) as List;
  //   // });
  //   //
  //   // print(parsedScheduleList.toString());
  //
  //
  //   // return parsedScheduleList
  //   //     .map((scheduleList) => new ScheduleDataResponse.fromJson(scheduleList))
  //   //     .toList();
  // }
  //
  //
  // static Future<List<ScheduleDataResponse>> _scheduleData() async {
  //
  //   final response = await http
  //       .get(Uri.parse('https://www.nasaniot.com/api/HA/GetSchedules?UserID=1'));
  //   if(response.statusCode == 200){
  //     return compute(scheduleData,response.body);
  //   } else {
  //     throw Exception('No Data');
  //   }
  //
  //   return scheduleData(response.body.toString());
  //   // Use the compute function to run parsePhotos in a separate isolate.
  // }
}

class TopBarTwo extends StatefulWidget {
  const TopBarTwo({Key key}) : super(key: key);

  @override
  _TopBarTwoState createState() => _TopBarTwoState();
}

class _TopBarTwoState extends State<TopBarTwo> {

  List<String> imageList = [
    wifi,
    check,
    wifi,
  ];
  List<String> cardTextList = [
    'Strength',
    'Check',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children:
      List.generate(3, (index){
        return Center(
          child: GestureDetector(
            child: getCard(imageList[index],cardTextList[index]),
            onTap: () async {
              switch(index){
                case 0:
                  Text('two');
                  //await showDialog(context: context, builder: (context)=>WifiDialog());
                  break;
                case 1:
                  Text('two');
                  break;
                case 2:
                  await showDialog(context: context, builder: (context)=>WifiSettingsDialog());
                  break;

              }
            },
          ),
        );
      })
      ,);
  }

  getCard(String image, String text){
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image,height: 60,width: 60,),
            Text(text),

          ],
        ),
      ),
    );
  }
}
