import 'package:flutter/material.dart';
import 'package:tracker/presentation/completed_walk/completed_walk_view.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import 'package:tracker/presentation/set_limit/set_limit_view.dart';
import 'package:tracker/presentation/splash/splash.dart';
import '../home/home_view.dart';
import '../home/home_view_model.dart';
import '../welcome/welcome_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String welcome = "/welcome";
  static const String homeRoute = "/home";
  static const String completeRoute = "/completed";
  static const String setLimit = "/setLimit";
}

class RoutesGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashView());
      case Routes.welcome:
        return MaterialPageRoute(builder: (BuildContext context)=>const WelcomeView());
      case Routes.homeRoute:
        final arguments = routeSettings.arguments as LimitArgument;
        return MaterialPageRoute(builder: (BuildContext context)=> HomeView(
          limit: arguments.limit,
        ));
      case Routes.completeRoute:
        final arguments = routeSettings.arguments as CompletedArguments;
        String distance = arguments.distance.toDouble().toStringAsFixed(2);
        return MaterialPageRoute(builder: (BuildContext context)=> CompletedView(
          totalDistance: distance,
        ));
      case Routes.setLimit:
        return MaterialPageRoute(builder: (BuildContext context)=> const SetLimitView());
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