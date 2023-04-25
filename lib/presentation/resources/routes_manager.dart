import 'package:flutter/material.dart';
import 'package:tracker/presentation/completed_walk/completed_walk_view.dart';
import 'package:tracker/presentation/main/main_view.dart';
import 'package:tracker/presentation/main/main_view_model.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import 'package:tracker/presentation/set_limit/set_limit_view.dart';
import 'package:tracker/presentation/splash/splash.dart';

class Routes{
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String completeRoute = "/completed";
  static const String setLimit = "/setLimit";
}

class RoutesGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashView());
      case Routes.mainRoute:
        final arguments = routeSettings.arguments as LimitArgument;
        return MaterialPageRoute(builder: (BuildContext context)=> MainView(
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