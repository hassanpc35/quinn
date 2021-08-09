import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onClick;

  CustomButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          color: label != 'No Show' ? AppColors.themeOrangeColor : AppColors.themeOrangeColor,
          height: 45,
          child: Text(label,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ))),
      onPressed: onClick,
    );
  }
}

class RoundedWhiteButton extends StatelessWidget{
  final String label;
  final Function onClick;

  RoundedWhiteButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
        )
    )
    //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
   // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:12,horizontal: 39),
        child: Text(label,
            style: TextStyle(
              fontSize: 15.0,
              color: AppColors.themeOrangeColor,
              fontWeight: FontWeight.w700,
            )),
      ),
      onPressed: onClick,
    );
  }

}

class RoundedOrangeButton extends StatelessWidget{
  final String label;
  final Function onClick;

  RoundedOrangeButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(50),
      child: ElevatedButton(

        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.orangeButtonColor),
            shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(50)),
                )
            )
          //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
          // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:ScreenUtil().setHeight(15),horizontal: ScreenUtil().setWidth(25),),
          child: Text(label,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color:Colors.white,
                fontWeight: FontWeight.w700,
              )),
        ),
        onPressed: onClick,
      ),
    );
  }

}

class LargeOrangeButton extends StatelessWidget{
  final String label;
  final Function onClick;

  LargeOrangeButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(291),
      height: ScreenUtil().setHeight(42),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(42)),
        child: ElevatedButton(


          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.orangeButtonColor),
              shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
                  )
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:ScreenUtil().setHeight(10)),
            child: Text(label,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color:Colors.white,
                  fontWeight: FontWeight.w700,
                )),
          ),
          onPressed: onClick,
        ),
      ),
    );
  }

}

class SmallOrangeButton extends StatelessWidget{
  final String label;
  final Function onClick;

  SmallOrangeButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: ElevatedButton(

        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.orangeButtonColor),
            shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            )
          //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
          // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12),
          child: Text(label,
              style: TextStyle(
                fontSize: 15.0,
                color:Colors.white,
                fontWeight: FontWeight.w700,
              )),
        ),
        onPressed: onClick,
      ),
    );
  }

}

class SmallGreyButton extends StatelessWidget{
  final String label;
  final Function onClick;

  SmallGreyButton({@required this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: ElevatedButton(

        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.greyButtonColor),
            shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            )
          //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
          // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12),
          child: Text(label,
              style: TextStyle(
                fontSize: 15.0,
                color:Colors.white,
                fontWeight: FontWeight.w700,
              )),
        ),
        onPressed: onClick,
      ),
    );
  }

}

class SmallBlueButton extends StatelessWidget{
  final String label;
  final Function onClick;
  final Icon prefixIcon;

  SmallBlueButton({@required this.label, this.onClick, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.buttonBlueColor),
          shadowColor: MaterialStateProperty.all(AppColors.containerShadowColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )
          )
        //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 10, 30, 10)),
        // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:3,horizontal: 12),
        child: Row(
          children: [
            prefixIcon,
            Text(label,
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
      onPressed: onClick,
    );
  }

}

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({Key key}) : super(key: key);


  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {

  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: AppColors.orangeButtonColor,
      selectedColor: AppColors.orangeButtonColor,
      borderRadius: BorderRadius.circular(30),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 36),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 36),
          child: Text(
            'Signup',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      isSelected: isSelected,
    );
  }
}



// class CustomToggleButton extends StatefulWidget {
//   @override
//   _CustomToggleButtonState createState() => _CustomToggleButtonState();
// }
//
// const double width = 300.0;
// const double height = 60.0;
// const double loginAlign = 1;
// const double signInAlign = 1;
// const Color selectedColor = Colors.white;
// const Color normalColor = Colors.black54;
//
// class _CustomToggleButtonState extends State<CustomToggleButton> {
//   double xAlign;
//   Color loginColor;
//   Color signInColor;
//
//   @override
//   void initState() {
//     super.initState();
//     xAlign = loginAlign;
//     loginColor = selectedColor;
//     signInColor = normalColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AnimatedAlign(
//           alignment: Alignment(xAlign, 0),
//           duration: Duration(milliseconds: 100),
//           child: Container(
//             width: width * 0.5,
//             height: height,
//             decoration: BoxDecoration(
//               color: Colors.lightGreen,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30.0),
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               xAlign = loginAlign;
//               loginColor = selectedColor;
//
//               signInColor = normalColor;
//             });
//           },
//           child: Container(
//             width: width * 0.5,
//             color: Colors.transparent,
//             alignment: Alignment.center,
//             child: Text(
//               'Login',
//               style: TextStyle(
//                 color: loginColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               xAlign = signInAlign;
//               signInColor = selectedColor;
//
//               loginColor = normalColor;
//             });
//           },
//           child: Align(
//             alignment: Alignment(1, 0),
//             child: Container(
//               width: width * 0.5,
//               color: Colors.transparent,
//               alignment: Alignment.center,
//               child: Text(
//                 'Signin',
//                 style: TextStyle(
//                   color: signInColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }





