

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quinn/route/route_generator.dart';
import 'utils/app_colors.dart';
import 'utils/navigation_service.dart';
import 'route/route_constant.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize: Size(425,812),

      builder:()=>MaterialApp(
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.themeOrangeColor
          )
        ),
        debugShowCheckedModeBanner: false,
        title: 'Quinn',
        initialRoute: splashRoute,
        navigatorKey: NavigationService().navigationKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }


}