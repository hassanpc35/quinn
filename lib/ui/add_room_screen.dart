import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/my_text_field.dart';
import 'package:quinn/model/device_type_response.dart';
import 'package:quinn/model/room_response.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:http/http.dart' as http;

class AddRoomUi extends StatefulWidget {
  const AddRoomUi({Key key}) : super(key: key);

  @override
  _AddRoomUiState createState() => _AddRoomUiState();
}

class _AddRoomUiState extends State<AddRoomUi> {
  String title = 'Add Room';
  int deviceId;
  Future<RoomResponse> roomList;

  TextEditingController device;
  TextEditingController roomName = TextEditingController();
  TextEditingController deviceMac = TextEditingController();

  var fetchRoomList;
  var deviceTypeList;

  String deviceType;

  List parsedDevice = [];

  List parsedRoom = [];

 int roomType=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRoomList();
    _getDeviceList();
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
      automaticallyImplyLeading: false,
      toolbarHeight: ScreenUtil().setHeight(41),
      title: Text(
        title,
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
        textAlign: TextAlign.left,
      ),
      backgroundColor: AppColors.themeOrangeColor,
    );
  }

  Widget body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(16),
                bottom: ScreenUtil().setHeight(16),
                left: ScreenUtil().setWidth(16)),
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: Text(
              'Type of Room',
              style: TextStyle(fontSize: ScreenUtil().setSp(15)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
            height: ScreenUtil().setHeight(95),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: parsedRoom.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            roomType = int.parse(parsedRoom[index].toString());
                          });

                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Container(
                            width: ScreenUtil().setWidth(87),
                            height: ScreenUtil().setHeight(87),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  sofa,
                                  height: ScreenUtil().setHeight(54),
                                  width: ScreenUtil().setWidth(63),
                                ),
                                Text(parsedRoom[index]['RoomName'], style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: ScreenUtil().setSp(14),

                                ),
                                textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(18),
                      left: ScreenUtil().setWidth(18),

                      right: ScreenUtil().setWidth(18)),
                  child: Container(
                    height: ScreenUtil().setHeight(51),
                    child: TextField(
                      controller: roomName,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      cursorColor: AppColors.blackTextBackgroundColor,
                      decoration: InputDecoration(
                        hintText: 'Room Name',
                        contentPadding:
                        EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().radius(5))),
                          borderSide: BorderSide(
                              color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().radius(5))),
                          borderSide: BorderSide(
                              color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                        ),
                        hintStyle: TextStyle(
                            height: ScreenUtil().setHeight(1),
                            fontSize: ScreenUtil().setSp(16),
                            color: AppColors.textFieldHintColor,
                            fontWeight: FontWeight.w500),
                      ),
                      style: TextStyle(
                          height: ScreenUtil().setHeight(1),
                          fontSize: ScreenUtil().setSp(16),
                          color: AppColors.blackTextBackgroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(18),
                      left: ScreenUtil().setWidth(18),

                      right: ScreenUtil().setWidth(18)),
                  child: Container(
                    height: ScreenUtil().setHeight(51),
                    child: TextField(
                      controller: deviceMac,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      cursorColor: AppColors.blackTextBackgroundColor,
                      decoration: InputDecoration(
                        hintText: 'Device MAC',
                        contentPadding:
                        EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().radius(5))),
                          borderSide: BorderSide(
                              color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().radius(5))),
                          borderSide: BorderSide(
                              color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                        ),
                        hintStyle: TextStyle(
                            height: ScreenUtil().setHeight(1),
                            fontSize: ScreenUtil().setSp(16),
                            color: AppColors.textFieldHintColor,
                            fontWeight: FontWeight.w500),
                      ),
                      style: TextStyle(
                          height: ScreenUtil().setHeight(1),
                          fontSize: ScreenUtil().setSp(16),
                          color: AppColors.blackTextBackgroundColor,
                          fontWeight: FontWeight.w500),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(18),
                      left: ScreenUtil().setWidth(18),
                      right: ScreenUtil().setWidth(18)),
                  child: Container(
                    height: ScreenUtil().setHeight(51),
                    decoration: ShapeDecoration(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width:ScreenUtil().setWidth(1) ),
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().radius(5))),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(15),
                          left: ScreenUtil().setWidth(30)),
                      child:DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          focusColor: Colors.white,
                          value: deviceType,
                          //style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          isExpanded: true,
                          items: parsedDevice.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(
                                item['DeviceName'],
                                style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              value: item['DeviceID'].toString(),
                            );
                          }).toList(),
                          hint: Text(
                            "Device Type",
                            style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              deviceType = value;
                              deviceId = int.parse(value);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: ScreenUtil().setHeight(18),
                //       left: ScreenUtil().setWidth(18),
                //       right: ScreenUtil().setWidth(18)),
                //   child: Container(
                //     width: ScreenUtil().setWidth(336),
                //     height: ScreenUtil().setHeight(52),
                //     decoration: ShapeDecoration(
                //       shape: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             color: AppColors.textFieldBorderColor,
                //             width: ScreenUtil().setWidth(1)),
                //         borderRadius: BorderRadius.all(
                //             Radius.circular(ScreenUtil().radius(5))),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.only(
                //           right: ScreenUtil().setWidth(15),
                //           left: ScreenUtil().setWidth(15)),
                //       child: DropdownButtonHideUnderline(
                //         child: DropdownButton<String>(
                //           focusColor: Colors.white,
                //           value: deviceType,
                //           //style: TextStyle(color: Colors.white),
                //           iconEnabledColor: Colors.black,
                //           isExpanded: true,
                //           items: parsedDevice.map((item) {
                //             return new DropdownMenuItem(
                //               child: new Text(
                //                 item['DeviceName'],
                //                 style: TextStyle(
                //                   color: AppColors.greyTextColor,
                //                   fontSize: ScreenUtil().setSp(14),
                //                 ),
                //               ),
                //               value: item['DeviceID'].toString(),
                //             );
                //           }).toList(),
                //           hint: Text(
                //             "Device Type",
                //             style: TextStyle(
                //               color: AppColors.greyTextColor,
                //               fontSize: ScreenUtil().setSp(14),
                //             ),
                //           ),
                //           onChanged: (String value) {
                //             setState(() {
                //               deviceType = value;
                //               deviceId = int.parse(value);
                //             });
                //           },
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(18),
                      left: ScreenUtil().setWidth(18),
                      right: ScreenUtil().setWidth(18)),
                  child: LargeOrangeButton(
                    label: 'Add Room',
                    onClick: () {
                      //NavigationService().pushNamed(addAppliancesRoute);
                      _saveRoom();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<RoomResponse>> _getRoomList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/API/HA/GetRoomList'));
    // Use the compute function to run parsePhotos in a separate isolate.
    return parseRoom(response.body);
  }

  List<RoomResponse> parseRoom(dynamic responseBody) {
    setState(() {
      parsedRoom = jsonDecode(responseBody);
    });

    print(parsedRoom);
    return parsedRoom
        .map((roomList) => new RoomResponse.fromJson(roomList))
        .toList();
  }

  Future<List<DeviceTypeResponse>> _getDeviceList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/API/HA/GetDeviceList'));

    return parseDevice(response.body);
  }

  List<DeviceTypeResponse> parseDevice(dynamic responseBody) {
    setState(() {
      parsedDevice = jsonDecode(responseBody);
    });

    print(parsedDevice);
    return parsedDevice
        .map((deviceList) => new DeviceTypeResponse.fromJson(deviceList))
        .toList();
  }

  Future<http.Response> _saveRoom() async {
    final response = await http.get(Uri.parse(
        'https://www.nasaniot.com/API/HA/SaveRoomDetails?'
        'UserID=1&RoomName=${roomName.text}&RoomType=$roomType&MACID=${deviceMac.text}&DeviceTYpe=$deviceId'));

    print('RESPONSE------$response');
    print(response.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body.toString());
      await NavigationService().pushNamed(addAppliancesRoute);
    } else {
      return null;
    }
  }



}
