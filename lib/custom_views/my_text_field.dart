import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quinn/utils/image_helpers.dart';
import '../utils/app_colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLine;
  final String prefixIcon;
  final String suffixIcon;
  final Function onClickPrefix;
  final Function onClickSuffix;
  final String hintText;

  MyTextField({
    this.controller,
    @required this.textInputType,
    this.maxLength,
    this.maxLine,
    this.prefixIcon,
    this.suffixIcon,
    this.onClickPrefix,
    this.onClickSuffix,
    this.hintText,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(18),
          left: ScreenUtil().setWidth(18),
          right: ScreenUtil().setWidth(18)),
      child: TextField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        keyboardType: widget.textInputType,
        maxLength: widget.maxLength,
        maxLines: widget.maxLine,
        cursorColor: AppColors.blackTextBackgroundColor,
        decoration: InputDecoration(
          suffixIcon: null,
          prefixIcon: null,
          counterText: '',
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: ScreenUtil().setWidth(1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: ScreenUtil().setWidth(1)),
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
    );
  }
}

class MyTextFieldSquare extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLine;
  final String prefixIcon;
  final SvgPicture suffixIcon;
  final Function onClickPrefix;
  final Function onClickSuffix;
  final String hintText;

  MyTextFieldSquare({
    this.controller,
    @required this.textInputType,
    this.maxLength,
    this.maxLine,
    this.prefixIcon,
    this.suffixIcon,
    this.onClickPrefix,
    this.onClickSuffix,
    this.hintText,
  });

  @override
  _MyTextFieldSquareState createState() => _MyTextFieldSquareState();
}

class _MyTextFieldSquareState extends State<MyTextFieldSquare> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(18),
          left: ScreenUtil().setWidth(18),
          right: ScreenUtil().setWidth(18)),
      child: TextField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        keyboardType: widget.textInputType,
        maxLength: widget.maxLength,
        maxLines: widget.maxLine,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          prefixIcon: null,
          counterText: '',
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().radius(5))),
            borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: ScreenUtil().setWidth(1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().radius(5))),
            borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: ScreenUtil().setWidth(1)),
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
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class LabelledTextBox extends StatelessWidget {
  static var time = '10:00 AM';
  static var on_off = 'ON';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: AppColors.textFieldBorderColor, spreadRadius: 1),
            ],
          ),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                SvgPicture.asset(
                  remove,
                  width: 25,
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.white,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            '$time $on_off',
            style: TextStyle(color: AppColors.greyTextColor),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLine;
  final String prefixIcon;
  final SvgPicture suffixIcon;
  final Function onClickPrefix;
  final Function onClickSuffix;
  final String hintText;
  final String title;

  CustomTextField({
    this.controller,
    @required this.textInputType,
    this.maxLength,
    this.maxLine,
    this.prefixIcon,
    this.suffixIcon,
    this.onClickPrefix,
    this.onClickSuffix,
    this.hintText,
    this.title,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(40),
              bottom: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(336),
          height: ScreenUtil().setHeight(52),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textFieldBorderColor),
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: TextField(
              textAlign: TextAlign.left,
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: widget.hintText,hintStyle: TextStyle(fontSize: ScreenUtil().setSp(15))),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10)),
          margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(10)),
          color: Colors.white,
          child: Text(
            '${widget.title}',
            style:
                TextStyle(fontSize: ScreenUtil().setSp(15), color: AppColors.darkestGreyTextColor),
          ),
        ),
      ],
    );
  }
}

class CustomLargeTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: ScreenUtil().setHeight(40)),
          width: ScreenUtil().setWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: AppColors.textFieldBorderColor, spreadRadius: 1),
            ],
          ),
          height: ScreenUtil().setHeight(200),
          child: Padding(
            padding:EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: TextField(
              maxLines: 5,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Message',hintStyle: TextStyle(fontSize: ScreenUtil().setSp(15))),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(30),
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10),),
          color: Colors.white,
          margin:
              EdgeInsets.only(left: ScreenUtil().setWidth(10),),
          child: Text('Message',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(15), color: AppColors.darkestGreyTextColor)),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: AppColors.textFieldBorderColor, spreadRadius: 1),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.065,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              maxLines: 1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Title'),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02),
          color: Colors.white,
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Title',
            style:
                TextStyle(fontSize: 15, color: AppColors.darkestGreyTextColor),
          ),
        ),
      ],
    );
  }
}
