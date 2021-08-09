import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/my_text_field.dart';
import 'package:quinn/model/appliance_response.dart';
import 'package:quinn/model/schedule_data_response.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:quinn/utils/navigation_service.dart';

class ReportIssueDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: ScreenUtil().setHeight(468),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Report Issue',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(22),
                    color: AppColors.darkestGreyTextColor)),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(21)),
              child: CustomTextField(title: 'Title',hintText: 'Enter Title',),
            ),
            CustomLargeTextField(),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(26)),
              child: LargeOrangeButton(label: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class WifiSettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.34,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wi-Fi Settings',
                style: TextStyle(
                    fontSize: 22, color: AppColors.darkestGreyTextColor)),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: CustomTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: CustomTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: LargeOrangeButton(label: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddApplianceDialog extends StatefulWidget {
  _AddApplianceDialogState createState() => _AddApplianceDialogState();
}

class _AddApplianceDialogState extends State<AddApplianceDialog> {
  List parsedAppliance = [];

  TextEditingController applianceName = TextEditingController();
  TextEditingController macAddress = TextEditingController();
  TextEditingController choosePort = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApplianceList().then((value) {
      setState(() {
        build(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Appliance',
                  style: TextStyle(
                      fontSize: 22, color: AppColors.darkestGreyTextColor)),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text('Type of Appliance',
                    style: TextStyle(
                        fontSize: 15, color: AppColors.darkestGreyTextColor)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: parsedAppliance.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 5,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      sofa,
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text(parsedAppliance[index]
                                        ['ApplianceName']),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //
                  //     // Card(
                  //     //   color: Colors.white,
                  //     //   elevation: 5,
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width*0.25,
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         SvgPicture.asset(sofa,height: 60,width: 60,),
                  //     //         Text('Living Room'),
                  //     //
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Card(
                  //     //   color: Colors.white,
                  //     //   elevation: 5,
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width*0.25,
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         SvgPicture.asset(bedroom,height: 60,width: 60,),
                  //     //         Text('Bed Room'),
                  //     //
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Card(
                  //     //   color: Colors.white,
                  //     //   elevation: 5,
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width*0.25,
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         SvgPicture.asset(kitchen,height: 60,width: 60,),
                  //     //         Text('Kitchen'),
                  //     //
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Card(
                  //     //   color: Colors.white,
                  //     //   elevation: 5,
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width*0.25,
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         SvgPicture.asset(balcony,height: 60,width: 60,),
                  //     //         Text('Balcony'),
                  //     //
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Card(
                  //     //   color: Colors.white,
                  //     //   elevation: 5,
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width*0.25,
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         SvgPicture.asset(bathroom,height: 60,width: 60,),
                  //     //         Text('Bathroom'),
                  //     //
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //
                  //   ],
                  // ),
                  // child: FutureBuilder<RoomResponse>(
                  //   future: null,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Text(snapshot.data.roomName);
                  //     } else if (snapshot.hasError) {
                  //       return Text("${snapshot.error}");
                  //     }
                  //
                  //     // By default, show a loading spinner.
                  //     return CircularProgressIndicator();
                  //   },
                  // ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.textFieldBorderColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        value: 'deviceType',
                        //style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        isExpanded: true,
                        items: <String>[]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: AppColors.greyTextColor),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Model",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14,
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            //deviceType = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(
                  controller: applianceName,
                  hintText: 'Appliance Name',
                  title: 'Appliance Name',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(
                    controller: macAddress,
                    hintText: 'MAC Address',
                    title: 'MAC Address'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(
                    controller: choosePort,
                    hintText: 'Port',
                    title: 'Choose Port'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallGreyButton(label: 'Cancel'),
                    SmallOrangeButton(
                      label: 'Add Appliance',
                      onClick: () {
                        _addAppliance(1, 2, applianceName.text, 1, 'brand',
                            choosePort.text, macAddress.text);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ApplianceResponse>> _getApplianceList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/API/HA/GetApplianceList'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return parseAppliance(response.body);
  }

  List<ApplianceResponse> parseAppliance(dynamic responseBody) {
    parsedAppliance = jsonDecode(responseBody);
    print(parsedAppliance);
    return parsedAppliance
        .map((applianceList) => new ApplianceResponse.fromJson(applianceList))
        .toList();
  }

  Future<http.Response> _addAppliance(
      dynamic userId,
      dynamic roomId,
      String applianceName,
      dynamic applianceType,
      String brand,
      dynamic relayNumber,
      dynamic macId) async {
    final response = await http.get(
      Uri.parse('https://www.nasaniot.com/API/HA/SaveApplianceDetails?'
          'UserID=1&RoomID=2&ApplianceName=$applianceName&ApplianceType=1&'
          'Brand=%27abc%27&RelayNo=1&IMACID=$macId'),
    );
    print('RESPONSE------$response');
    print(response.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body.toString());
      await NavigationService().pushNamed(dashboardRoute);
    } else {
      return null;
    }
  }
}

class EditApplianceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edit Appliance',
                  style: TextStyle(
                      fontSize: 22, color: AppColors.darkestGreyTextColor)),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text('Type of Appliance',
                    style: TextStyle(
                        fontSize: 15, color: AppColors.darkestGreyTextColor)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sofa,
                                height: 60,
                                width: 60,
                              ),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sofa,
                                height: 60,
                                width: 60,
                              ),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sofa,
                                height: 60,
                                width: 60,
                              ),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sofa,
                                height: 60,
                                width: 60,
                              ),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sofa,
                                height: 60,
                                width: 60,
                              ),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomDropdownField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: CustomTextField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallGreyButton(label: 'Cancel'),
                    SmallOrangeButton(label: 'Save',onClick: (){
                      updateAppliances('userId','roomId','roomName','roomType','macId','deviceType');
                    },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<http.Response> updateAppliances(String userId, String roomId, String roomName,
      String roomType, String macId, String deviceType) async {
    final response = await http.get(
      // Uri.parse('https://www.nasaniot.com/API/HA/SaveUserProfile?'
      //     'Username=$name&Password=$password&Emailid=$email&'
      //     'CountryName=${country.toString()}&CityName=${city.toString()}&DeviceOS=Andriod&AppVersion=1.0.0'),
      Uri.parse('https://www.nasaniot.com/api/HA/UpdateRoomDetails?UserID=1&'
          'RoomID=1&RoomName=%22Test%20Room%22&RoomType=2&MACID=%2212345678%22&DeviceType=2'),
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
}

class NoScheduleDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.52,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Schedules',
                style: TextStyle(
                    fontSize: 22, color: AppColors.darkestGreyTextColor)),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                noschedule,
                width: 201,
                height: 201,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.orangeButtonColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text('Create Schedules',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => CreateScheduleDialog());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ACControlDialog extends StatelessWidget {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(color: AppColors.wattPinkColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(' 110 V ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                    Text('Sit Out AC',
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.buttonBlueColor),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SvgPicture.asset(
                                edit,
                                width: 11,
                                height: 11,
                              ),
                            ),
                            Text(
                              '  Edit  ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      plus,
                      color: Colors.orange,
                      width: 128,
                      height: 128,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.buttonBlueColor),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SvgPicture.asset(
                                delete,
                                width: 11,
                                height: 11,
                              ),
                            ),
                            Text(
                              'Delete',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(
                  plus,
                  color: Colors.orange,
                  width: 200,
                  height: 200,
                ),
                CupertinoSwitch(value: _switchValue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 39,
                      color: Colors.orange,
                    ),
                    Text('Cool'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 39,
                      color: Colors.orange,
                    ),
                    Text('Dry'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 39,
                      color: Colors.orange,
                    ),
                    Text('Fan'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 39,
                      color: Colors.orange,
                    ),
                    Text('Heat'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 39,
                      color: Colors.orange,
                    ),
                    Text('Auto'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FanControlDialog extends StatelessWidget {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(color: AppColors.wattPinkColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(' 110 V ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                    Text('Fan',
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.buttonBlueColor),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SvgPicture.asset(
                                edit,
                                width: 11,
                                height: 11,
                              ),
                            ),
                            Text(
                              '  Edit  ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      plus,
                      color: Colors.orange,
                      width: 128,
                      height: 128,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.buttonBlueColor),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SvgPicture.asset(
                                delete,
                                width: 11,
                                height: 11,
                              ),
                            ),
                            Text(
                              'Delete',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(
                  plus,
                  color: Colors.orange,
                  width: 200,
                  height: 200,
                ),
                CupertinoSwitch(value: _switchValue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TvControlDialog extends StatelessWidget {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(color: AppColors.wattPinkColor),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(' 110 V ',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TV in Hall',
                    style: TextStyle(fontSize: 22, color: Colors.black)),
                SvgPicture.asset(
                  plus,
                  width: 128,
                  height: 128,
                  color: Colors.orange,
                ),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    _switchValue = value;
                  },
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.buttonBlueColor),
                    ),
                    onPressed: null,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: SvgPicture.asset(
                            edit,
                            width: 11,
                            height: 11,
                          ),
                        ),
                        Text(
                          '  Edit  ',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.buttonBlueColor),
                    ),
                    onPressed: null,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: SvgPicture.asset(
                            delete,
                            width: 11,
                            height: 11,
                          ),
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleDialog extends StatefulWidget {


  @override
  _ScheduleDialogState createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  List parsedSchedule=[];


  gridView(AsyncSnapshot<List<ScheduleDataResponse>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map((schedule) {
          return GestureDetector(
            child: GridTile(
              child: Container(
                  color:Colors.blue,child: Text('${schedule.schedules}')),
            ),
            onTap: () {},
          );
        }).toList(),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _schedulesList();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Schedules',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.greyTextColor,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              Flexible(
                  child: FutureBuilder<List<ScheduleDataResponse>>(
                    future: _schedulesList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Text('ERROR ${snapshot.error}');
                        //return addRoomContainer();
                      } else if (snapshot.hasData) {
                        return gridView(snapshot);
                      }
                      return circularProgress();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  List<ScheduleDataResponse> parseSchedule(dynamic responseBody) {


    var list = json.decode(responseBody) as List<dynamic>;
    List<ScheduleDataResponse> roomList = list.map((model) => ScheduleDataResponse.fromJson(model)).toList();
    return roomList;
  }
  Future<List<ScheduleDataResponse>> _schedulesList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/api/hA/Getschedules?UserID=1'));
    // Use the compute function to run parsePhotos in a separate isolate.
    if (response.statusCode == 200) {
      print(response.body);
      return parsedSchedule.map((cityList) {
        return new ScheduleDataResponse.fromJson(cityList);
      }).toList();
    } else {
      throw Exception('Can\'t get rooms');
    }
  }
}

class WifiDialog extends StatelessWidget {
  const WifiDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            CustomTextField(),
            CustomLargeTextField(),
          ],
        ),
      ),
    );
  }
}

class ApplianceImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CreateScheduleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 12,
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
