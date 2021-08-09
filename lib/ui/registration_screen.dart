import 'dart:convert';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quinn/model/city_response.dart';
import 'package:quinn/model/country_response.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:http/http.dart' as http;

class RegistrationUi extends StatefulWidget {
  final Function onClick;
  final dynamic args;
  final Function showToast;

  RegistrationUi({this.onClick, this.args, this.showToast});

  @override
  State<StatefulWidget> createState() => _RegistrationUiState();
}

class _RegistrationUiState extends State<RegistrationUi>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _index = 0;

  FocusNode fName = FocusNode();
  FocusNode fEmail = FocusNode();
  FocusNode fCountry = FocusNode();
  FocusNode fCity = FocusNode();
  FocusNode fPassword = FocusNode();
  FocusNode fRePassword = FocusNode();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();
  TextEditingController lUserName = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  List<CityResponse> cityList = [];

  String hCountry;
  String hCity;

  CountryResponse countryObj = CountryResponse();
  CityResponse cityObj = CityResponse();

  List parsedCountry = [];

  Future<List<CountryResponse>> fetchCountryList;

  int countryId;

  List parsedCity = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _getCountryList();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: mainUi(),
        ));
  }

  Widget mainUi() {
    return Container(
      color: AppColors.themeBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///Image
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(42),
                  bottom: ScreenUtil().setHeight(36)),
              width: ScreenUtil().setWidth(425),
              height: ScreenUtil().setHeight(82),
              child: Image.asset(quinn,
                  width: ScreenUtil().setWidth(82),
                  height: ScreenUtil().setHeight(82),
                  fit: BoxFit.contain),
            ),

            ///content
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.containerShadowColor,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(10))),
              width: ScreenUtil().setWidth(340),
              height: _index == 0
                  ? ScreenUtil().setHeight(284)
                  : ScreenUtil().setHeight(540),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///tabs items
                  tabs(context),
                  _index == 0 ? login(context) : signUp(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: ScreenUtil().setWidth(340),
      height: ScreenUtil().setHeight(215),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ///login content
          Column(
            children: <Widget>[
              ///email text field
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(18),
                    left: ScreenUtil().setWidth(18),
                    right: ScreenUtil().setWidth(18)),
                child: Container(
                  height: ScreenUtil().setHeight(51),
                  child: TextField(
                    controller: lUserName,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
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

              ///password text field
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(18),
                    left: ScreenUtil().setWidth(18),
                    right: ScreenUtil().setWidth(18)),
                child: Container(
                  height: ScreenUtil().setHeight(51),
                  child: TextField(
                    controller: lPassword,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      hintStyle: TextStyle(
                          height: 1,
                          fontSize: ScreenUtil().setSp(16),
                          color: AppColors.textFieldHintColor,
                          fontWeight: FontWeight.w500),
                    ),
                    style: TextStyle(
                        height: 1,
                        fontSize: ScreenUtil().setSp(16),
                        color: AppColors.blackTextBackgroundColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  NavigationService().pushNamed(forgetPasswordRoute);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(21),
    ),
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.themeOrangeColor,
                        fontSize: ScreenUtil().setSp(16)),
                  ),
                ),
              ),
            ],
          ),

          ///submit button
          Positioned(
              bottom: ScreenUtil().setHeight(-25),
              child: Container(
                height: ScreenUtil().setHeight(51),
                child: RoundedOrangeButton(
                  onClick: () async {
                    logindetails(lUserName.text,lPassword.text);
                    //await NavigationService().pushNamed(dashboardRoute);
                  },
                  label: 'Submit',
                ),
              )),
        ],
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: ScreenUtil().setWidth(340),
      height: ScreenUtil().setHeight(460),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(18),
                    left: ScreenUtil().setWidth(18),

                    right: ScreenUtil().setWidth(18)),
                child: Container(
                  height: ScreenUtil().setHeight(51),
                  child: TextField(
                    controller: name,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      contentPadding:
                      EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
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
                    controller: email,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                      EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
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
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().radius(50))),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(15),
                        left: ScreenUtil().setWidth(30)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        value: hCountry,
                        //style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        isExpanded: true,
                        items: parsedCountry.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['CountryName'],style: TextStyle(fontSize: ScreenUtil().setSp(14)),),
                            value: item['CountryID'].toString(),
                          );
                        }).toList(),
                        hint: Text(
                          "Select Country",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            hCity = null;
                            hCountry = value;
                            countryId = int.parse(value);
                            _getCityList();
                          });
                        },
                      ),
                    ),
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
                          color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().radius(50))),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(15),
                        left: ScreenUtil().setWidth(30)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        value: hCity,
                        //style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        isExpanded: true,
                        items: parsedCity.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['CityName'],style: TextStyle(fontSize: ScreenUtil().setSp(14),),),
                            value: item['CityID'].toString(),
                          );
                        }).toList(),
                        hint: Text(
                          "Select City",
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            hCity = value;
                          });
                        },
                      ),
                    ),
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
                  child:TextField(
                    controller: password,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                      EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
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
                    bottom: ScreenUtil().setHeight(18),
                    left: ScreenUtil().setWidth(18),
                    right: ScreenUtil().setWidth(18)),
                child: Container(
                  height: ScreenUtil().setHeight(51),
                  child: TextField(
                    controller: reEnterPassword,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    cursorColor: AppColors.blackTextBackgroundColor,
                    decoration: InputDecoration(
                      hintText: 'Re-enter Password',
                      contentPadding:
                      EdgeInsets.only(left: ScreenUtil().setWidth(56)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: ScreenUtil().setWidth(1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().radius(50))),
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
            ],
          ),
          Positioned(
              bottom: ScreenUtil().setHeight(-25),
              child: RoundedOrangeButton(
                onClick: () async {
                  await saveUser(name.text, email.text, hCountry, hCity,
                      password.text, reEnterPassword.text);
                  //await NavigationService().pushNamed(dashboardRoute);
                },
                label: 'Submit',
              )),
        ],
      ),
    );
  }

  Widget tabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(18),
        left: ScreenUtil().setWidth(32),
        right: ScreenUtil().setWidth(32),
      ),
      child: Container(
        height: ScreenUtil().setHeight(51),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///Login tab
            Expanded(
                child: GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                      color: _index == 0
                          ? AppColors.themeOrangeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text('Login',
                          style: TextStyle(
                              color: _index == 0
                                  ? Colors.white
                                  : AppColors.greyTextColor,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: _index == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal)))),
              onTap: () {
                setState(() {
                  _index = 0;
                });
              },
            )),

            ///signup tab
            Expanded(
                child: GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                      color: _index == 1
                          ? AppColors.themeOrangeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text('Signup',
                          style: TextStyle(
                              color: _index == 1
                                  ? Colors.white
                                  : AppColors.greyTextColor,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: _index == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal)))),
              onTap: () {
                setState(() {
                  _index = 1;
                });
              },
            )),
          ],
        ),
      ),
    );
  }

  // Future<CountryResponse> _getCountryList() async {
  //   final response = await http.get(Uri.parse('https://www.nasaniot.com/API/HA/GetCountryList'));
  //   print("Response - $response");
  //   dynamic data = response.body;
  //   List<CountryResponse> countryList = [];
  //   data.forEach((element){
  //     CountryResponse countryEntity = CountryResponse.fromJson(element);
  //     countryList.add(countryEntity);
  //   });
  //   return null;
  // }

  // Future<CityResponse> _getCityList() async {
  //   final response = await http.get(Uri.parse('https://www.nasaniot.com/API/HA/GetCityList?CountryID=1'));
  //   print("Response - $response");
  //   dynamic data = response.body;
  //   List<CityResponse> cityList = [];
  //   data.forEach((element){
  //     CityResponse cityEntity = CityResponse.fromJson(element);
  //     cityList.add(cityEntity);
  //   });
  //   return null;
  // }

  // Future<CountryResponse> _getCountryList() async {
  //   final http.Response response = await http
  //       .get(Uri.parse('https://www.nasaniot.com/API/HA/GetCountryList'));
  //   if(response !=null){
  //     countryList =response.body as List;
  //     print(countryList);
  //     return CountryResponse.fromJson(response.body);
  //
  //   }
  //  return null;
  //
  // }

  // List<CountryResponse> parseCountries(dynamic responseBody) {
  //   List parsedCountry = jsonDecode(responseBody);
  //   print(parsedCountry);
  //   return parsedCountry.map((countryList) => new CountryResponse.fromJson(countryList)).toList();
  //
  // }

  // Future<CityResponse> _getCityList() async {
  //   final response = await http.get(Uri.parse('https://www.nasaniot.com/API/HA/GetCityList?CountryID=1'));
  //   print("Response - $response");
  //   dynamic data = response.body;
  //   List<CityResponse> cityList = [];
  //   data.forEach((element){
  //     CityResponse cityEntity = CityResponse.fromJson(element);
  //     cityList.add(cityEntity);
  //   });
  //   return null;
  // }

  Future<List<CountryResponse>> _getCountryList() async {
    final response = await http
        .get(Uri.parse('https://www.nasaniot.com/API/HA/GetCountryList'));
    if (response.statusCode == 200) {
      return parseCountry(response.body);
    } else {
      return null;
    }
  }

  List<CountryResponse> parseCountry(dynamic responseBody) {
    setState(() {
      parsedCountry = jsonDecode(responseBody);
    });
    print('PARSED + $parsedCountry');
    return parsedCountry.map((pCountryList) {
      return new CountryResponse.fromJson(pCountryList);
    }).toList();
  }

  Future<List<CityResponse>> _getCityList() async {
    final response = await http.get(Uri.parse(
        'https://www.nasaniot.com/API/HA/GetCityList?CountryID=$countryId'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return parseCity(response.body);
  }

  List<CityResponse> parseCity(dynamic responseBody) {
    setState(() {
      parsedCity = jsonDecode(responseBody);
    });

    print(parsedCity);

    return parsedCity.map((cityList) {
      return new CityResponse.fromJson(cityList);
    }).toList();
  }

  Future<http.Response> saveUser(String name, String email, String country,
      String city, String password, String rePassword) async {
    final response = await http.get(
      Uri.parse('https://www.nasaniot.com/API/HA/SaveUserProfile?'
          'Username=$name&Password=$password&Emailid=$email&'
          'CountryName=${country.toString()}&CityName=${city.toString()}&DeviceOS=Andriod&AppVersion=1.0.0'),
    );
    print('https://www.nasaniot.com/API/HA/SaveUserProfile?'
        'Username=$name&Password=$password&Emailid=$email&'
        'CountryName=${country.toString()}&CityName=${city.toString()}&DeviceOS=Andriod&AppVersion=1.0.0');
    print('RESPONSE------$response');
    print(response.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('RESPONSEEEEEEE------${response.toString()}');
      await NavigationService().pushNamed(homeRoute);
    } else {
      return null;
    }
  }

  Future<http.Response> logindetails(String userName, String password) async {
    final response = await http.get(
      Uri.parse('https://www.nasaniot.com/API/HA/CheckLogin?Username=$userName&Password=$password'));
    print('https://www.nasaniot.com/API/HA/CheckLogin?Username=$userName&Password=$password');
    print('RESPONSE------$response');
    print(response.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('RESPONSEEEEEEE------${response.toString()}');
      await NavigationService().pushNamed(dashboardRoute);
    } else {
      return null;
    }
  }

 // Future<CityResponse> _getCityList() async {
//   final http.Response response = await http
//       .get(Uri.parse('https://www.nasaniot.com/API/HA/GetCityList?CountryID=1'));
//   if(response !=null){
//     cityList =response.body as List;
//     print(cityList);
//     return CityResponse.fromJson(response.body).;
//
//   }
//   return null;
//
// }
}
