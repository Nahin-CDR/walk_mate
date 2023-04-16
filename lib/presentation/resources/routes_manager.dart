import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import 'package:tracker/presentation/splash/splash.dart';

class Routes{
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
}

class RoutesGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashView());
      default:
        return MaterialPageRoute(builder: (BuildContext context){
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(AppString.noRouteFound),
            ),
          );
        });
    }
  }
}