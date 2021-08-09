import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quinn/route/route_constant.dart';
import 'package:quinn/ui/add_appliances_screen.dart';
import 'package:quinn/ui/add_room_screen.dart';
import 'package:quinn/ui/analytics_screen.dart';
import 'package:quinn/ui/dashboard_screen.dart';
import 'package:quinn/ui/forgot_password_screen.dart';
import 'package:quinn/ui/home_screen.dart';
import 'package:quinn/ui/registration_screen.dart';
import 'package:quinn/ui/splash_screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case registrationRoute:
        return MaterialPageRoute(
            builder: (_) => RegistrationUi());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeUi());
        break;
      case addRoom:
        return MaterialPageRoute(builder: (_) => AddRoomUi());
      case addAppliancesRoute:
        return MaterialPageRoute(builder: (_) => AddAppliancesUi());
        break;
      case analyticsRoute:
        return MaterialPageRoute(
            builder: (_) => AnalyticsUi());
        break;
      case dashboardRoute:
        return MaterialPageRoute(
            builder: (_) => DashboardUi());
        break;
    // case cardDetailsRoute:
    //   return MaterialPageRoute(
    //       builder: (_) => CardDetailsScreen(settings.arguments));
    //   break;
    // case goCardLessWebViewRoute:
    //   return MaterialPageRoute(
    //       builder: (_) => GoCardLessWebViewScreen(settings.arguments));
    //   break;
    // case payoutDetailsRoute:
    //   return MaterialPageRoute(
    //       builder: (_) => PayoutDetailsScreen(settings.arguments));
    //   break;
    // case changePasswordRoute:
    //   return MaterialPageRoute(
    //       builder: (_) => ChangePasswordScreen(settings.arguments));
    //   break;
    // case loginRoute:
    //   return MaterialPageRoute(builder: (_) => LoginScreen());
    //   break;
      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordUi());
        break;
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
    }
  }
}