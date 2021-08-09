import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quinn/custom_views/my_dialog_boxes.dart';
import 'package:quinn/ui/settings_screen.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';
import 'analytics_screen.dart';
import 'home_screen.dart';

class DashboardUi extends StatefulWidget {
  const DashboardUi({Key key}) : super(key: key);

  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi> {
  String appName = 'QUINN';
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomeUi(),
    AnalyticsUi(),
    SettingsUi(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBar(),
      body: _children[_selectedIndex],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      toolbarHeight: 50,
      title: Text(appName),
      backgroundColor: AppColors.themeOrangeColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: SvgPicture.asset(plus,height: 24,width: 24),
            onTap:(){
              NavigationService().pushNamed(addRoom);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: SvgPicture.asset(info,height: 24,width: 24),
            onTap:() async {
              await showDialog(context: context, builder: (context)=>ReportIssueDialog());
            },
          ),
        ),
      ],
    );
  }

  // Widget body() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white
  //     ),
  //     height: MediaQuery.of(context).size.height - 50,
  //     child: Column(
  //       children: [
  //         TopBar(),
  //         Container(
  //           padding: EdgeInsets.only(top: 15, bottom: 10, left: 20),
  //           width: MediaQuery.of(context).size.width,
  //           color: AppColors.dividerGreyColor,
  //           child: Text('Rooms'),
  //         ),
  //         addRoomContainer(),
  //         //roomContainer(),
  //       ],
  //     ),
  //   );
  // }


  Widget bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(
                  Icons.analytics_outlined,
                  color: Colors.black,
                ),
              ),
              title: Text('Analytics', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.themeOrangeColor,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5);
  }

  // Widget addRoomContainer() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Center(
  //         child: Container(
  //           alignment: Alignment.center,
  //           height: MediaQuery.of(context).size.height*0.4,
  //           child: Image.asset(noroom,height: 201,width: 201,),
  //         ),
  //       ),
  //       LargeOrangeButton(
  //         label: 'Add Room',
  //         onClick: () {
  //           NavigationService().pushReplacementNamed(addRoom);
  //         },
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget roomContainer() {
  //   return Container(
  //     height: MediaQuery.of(context).size.height - 350,
  //     child: GridView.count(
  //       crossAxisCount: 2,
  //       children: List.generate(8, (index) {
  //         return Center(
  //           child: Icon(Icons.ac_unit),
  //         );
  //       }),
  //     ),
  //   );
  // }

}
