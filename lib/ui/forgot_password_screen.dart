import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quinn/custom_views/custom_button.dart';
import 'package:quinn/custom_views/my_text_field.dart';
import 'package:quinn/utils/app_colors.dart';
import 'package:quinn/utils/image_helpers.dart';
import 'package:quinn/utils/navigation_service.dart';
import 'package:quinn/route/route_constant.dart';

class ForgetPasswordUi extends StatefulWidget {
  const ForgetPasswordUi({Key key}) : super(key: key);

  @override
  _ForgetPasswordUiState createState() => _ForgetPasswordUiState();
}

class _ForgetPasswordUiState extends State<ForgetPasswordUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: forgetPassword(context),
        ));
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: AppColors.themeBackgroundColor,
        child: Column(children: [
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
            height: ScreenUtil().setHeight(223),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeOrangeColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(18),
                          left: ScreenUtil().setWidth(18),
                          right: ScreenUtil().setWidth(18)),
                      child: Container(
                        height: ScreenUtil().setHeight(51),
                        child: TextField(
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
                  ],
                ),
                Positioned(
                    bottom: ScreenUtil().setHeight(-25),
                    child: RoundedOrangeButton(
                      onClick: () {
                        NavigationService().pushNamed(registrationRoute);
                      },
                      label: 'Submit',
                    )),
              ],
            ),
          ),
        ]));
  }
}
