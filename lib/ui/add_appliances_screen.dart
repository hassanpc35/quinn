import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quinn/custom_views/my_dialog_boxes.dart';
import 'package:quinn/custom_views/top_bar.dart';
import 'package:quinn/model/appliance_list_data.dart';
import 'package:quinn/model/appliance_response.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:http/http.dart' as http;
class AddAppliancesUi extends StatefulWidget {
  const AddAppliancesUi({Key key}) : super(key: key);

  @override
  _AddAppliancesUiState createState() => _AddAppliancesUiState();
}

class _AddAppliancesUiState extends State<AddAppliancesUi> {

  String title='Master Bed Room';

  Future<ApplianceResponse> fetchApplianceList;

  List parsedAppliancesList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appliancesList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Widget appBar() {
    return AppBar(
      toolbarHeight: 50,
      title: Text(title),
      backgroundColor: AppColors.themeOrangeColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: SvgPicture.asset(edit,height: 24,width: 24),
            onTap:() async {
              await showDialog(context: context, builder: (context)=>EditApplianceDialog());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: SvgPicture.asset(delete,height: 24,width: 24),
            onTap:() async {
              deleteRoom('1','1');
              // await showDialog(context: context, builder: (context)=>FanControlDialog());
            },
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      height: MediaQuery.of(context).size.height - 50,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopBarTwo(),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10, left: 20),
              width: MediaQuery.of(context).size.width,
              color: AppColors.dividerGreyColor,
              child: Text('Appliances in Master Bed Room'),
            ),
            addAppliances(),
            //addRoomContainer(),
            //roomContainer(),
          ],
        ),
      ),
    );
  }

  Widget addAppliances() {
    return Container(
      height: MediaQuery.of(context).size.height - 350,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(1, (index) {
          return Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              InkWell(
              child: SvgPicture.asset(plus,height: 60,width: 60,color: Colors.blue,),
                onTap:() async {
                  await showDialog(context: context, builder: (context)=>AddApplianceDialog());
                },
            ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add Appliances'),
                  ),

                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<http.Response> deleteRoom(String userId, String roomId) async {
    final response = await http.get(
      // Uri.parse('https://www.nasaniot.com/API/HA/SaveUserProfile?'
      //     'Username=$name&Password=$password&Emailid=$email&'
      //     'CountryName=${country.toString()}&CityName=${city.toString()}&DeviceOS=Andriod&AppVersion=1.0.0'),
      Uri.parse('https://www.nasaniot.com/api/HA/DeleteRoomDetails?UserID=$userId&RoomID=$roomId'),
    );
    print('RESPONSE------$response');
    print(response.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('RESPONSEEEEEEE------${response.toString()}');
      await NavigationService().pushNamed(addAppliancesRoute);
    } else {
      return null;
    }
  }

  Future<List<ApplianceListResponse>> _appliancesList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/api/HA/GetAppliances?USerid=1&RoomID=1'));
    // Use the compute function to run parsePhotos in a separate isolate.
    return parseRoom(response.body);
  }

  List<ApplianceListResponse> parseRoom(dynamic responseBody) {
    setState(() {
      parsedAppliancesList = jsonDecode(responseBody);
    });

    print(parsedAppliancesList);


    return parsedAppliancesList
        .map((roomsList) => new ApplianceListResponse.fromJson(roomsList))
        .toList();
  }



}
