import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/my_dialog_boxes.dart';
import 'package:quinn/custom_views/top_bar.dart';
import 'package:quinn/model/photo.dart';
import 'package:quinn/model/room_list_response.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:http/http.dart' as http;

class HomeUi extends StatefulWidget {
  const HomeUi({Key key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {


  Detail details = new Detail();

  gridView(AsyncSnapshot<List<RoomListResponse>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map((roomList) {
          return GestureDetector(
            child: GridTile(
              child: Container(
                  color:Colors.blue,child: Text('${roomList.rooms}')),
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

  String appName = 'QUINN';

  //dynamic parsedRoomsList = [];

  // dynamic noOfRooms = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _roomList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatingActionButton(),
      // bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: ScreenUtil().setHeight(53),
      title: Text(
        appName,
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
        textAlign: TextAlign.left,
      ),
      backgroundColor: AppColors.themeOrangeColor,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(13),
              bottom: ScreenUtil().setHeight(13),
              right: ScreenUtil().setWidth(13)),
          child: InkWell(
            child: SvgPicture.asset(plus,
                height: ScreenUtil().setHeight(26),
                width: ScreenUtil().setWidth(26)),
            onTap: () {
              NavigationService().pushNamed(addRoom);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(13),
              bottom: ScreenUtil().setHeight(13),
              right: ScreenUtil().setWidth(13)),
          child: GestureDetector(
            child: SvgPicture.asset(info,
                height: ScreenUtil().setHeight(26),
                width: ScreenUtil().setWidth(26)),
            onTap: () async {
              await showDialog(
                  context: context, builder: (context) => ReportIssueDialog());
            },
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(15),
                  bottom: ScreenUtil().setHeight(10),
                  left: ScreenUtil().setWidth(20)),
              width: MediaQuery.of(context).size.width,
              color: AppColors.dividerGreyColor,
              child: Text('Rooms'),
            ),
            //addRoomContainer(),
            roomContainer(),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.mic,
          size: 30,
          color: AppColors.themeOrangeColor,
        ),
        backgroundColor: Colors.white,
        onPressed: null);
  }

  Widget addRoomContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              noroom,
              height: 201,
              width: 201,
            ),
          ),
        ),
        LargeOrangeButton(
          label: 'Add Room',
          onClick: () {
            NavigationService().pushNamed(addRoom);
          },
        ),
      ],
    );
  }

  Widget roomContainer() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height - 350,
      child: Column(
        children: [
          Flexible(
              child: FutureBuilder(
            future: _roomList(),
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
    );
  }

  getRoomsCard(String image, String text) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 60,
              width: 60,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Future<List<RoomListResponse>> _roomList() async {
    Response respone = await get(
        Uri.parse("https://www.nasaniot.com/API/HA/Getrooms?UserID=1"));
    Map<String, dynamic> resp = jsonDecode(respone.body);
    setState(() {
      details = Detail.fromJson(resp);
      print(details);
      print(resp.toString() + "SUCCESSSSS!!");
    });
  }

  // static List<Photo> parsePhotos(String responseBody) {
  //   var list = json.decode(responseBody) as List<dynamic>;
  //   List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  //   return photos;
  // }
  //
  // static Future<List<Photo>> fetchPhotos() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //   if (response.statusCode == 200) {
  //     return compute(parsePhotos, response.body);
  //   } else {
  //     throw Exception('Can\'t get photos');
  //   }
  // }

  // Future<List<RoomListResponse>> _roomList() async {
  //   final response = await http
  //       .get(Uri.parse('https://www.nasaniot.com/API/HA/Getrooms?UserID=1'));
  //   Map<String, dynamic> resp = jsonDecode(response.body);
  //   setState(() {
  //
  //   });
  //   // return parseRoom(response.body);
  // }
  //
  // List<RoomListResponse> parseRoom(dynamic responseBody) {
  //
  //   setState(() {
  //     parsedRoomList = jsonDecode(responseBody) as List<dynamic>;
  //   });
  //
  //   print(parsedRoomList);
  //   return parsedRoomList
  //       .map((roomList) => new RoomListResponse.fromJson(roomList));
  // }

  // List<RoomListResponse> parseRoom(dynamic responseBody) {
  //
  //
  //   var list = json.decode(responseBody) as List<dynamic>;
  //   List<RoomListResponse> roomList = list.map((model) => RoomListResponse.fromMap(model)).toList();
  //   return roomList;
  // }
  // Future<List<RoomListResponse>> _roomsList() async {
  //   final response = await http
  //       .get(Uri.parse('https://www.nasaniot.com/api/hA/Getrooms?UserID=1'));
  //   // Use the compute function to run parsePhotos in a separate isolate.
  //   if (response.statusCode == 200) {
  //     return compute(parseRoom, response.body);
  //   } else {
  //     throw Exception('Can\'t get rooms');
  //   }
  // }

//
// static Future<List<RoomsListResponse>> _roomsList() async {
//   final response = await http
//       .get(Uri.parse('https://www.nasaniot.com/api/hA/Getrooms?UserID=1'));
//   if(response.statusCode == 200){
//     print('FINAL ${response.body.length}');
//     return compute(parseRoom,response.body.toString());
//   } else {
//     throw Exception('No Data');
//   }
//
// }
// static List<RoomsListResponse> parseRoom(dynamic responseBody) {
//   var roomList = json.decode(responseBody) as List<dynamic>;
//   List<RoomsListResponse> roomData = roomList.map((e) => RoomsListResponse.fromJson(e)).toList();
//
//   print('ROOMDATA:- $roomData');
//   return roomData;
//
//   // setState(() {
//   //   parsedRoomsList = jsonDecode(responseBody);
//   // });
//
//  // print('NO ROOMS:---$parsedRoomsList');
//
//   // return parsedRoomsList
//   //     .map((roomsList) => new RoomsListResponse.fromJson(roomsList).toString())
//   //     .toList();
// }

}
