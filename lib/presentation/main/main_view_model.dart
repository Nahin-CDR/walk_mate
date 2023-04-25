import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../resources/routes_manager.dart';

class MainViewModel with ChangeNotifier{
  int h = 0;
  int m = 0;
  int s = 0;
  int sec = 600;
  double hours = -1;
  double minutes = -1;
  double seconds = 0;
  double rem1 = 0;
  double rem2 = 0;

  double startLat = 0.0;
  double startLong = 0.0;
  double endLat = 0.0;
  double endLong = 0.0;
  bool firstHit = true;
  double distance = 0.0;

  void startCountDown({required int second,required BuildContext context}) {
    sec = second;
    getCurrentPosition();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec >= 0) {
        hours = sec / 3600.round();
        h = hours.toInt();
        rem1 = sec % 3600; //remaining seconds after taking hour
        minutes = rem1 / 60.round();
        m = minutes.toInt();
        rem2 = rem1 % 60;
        seconds = rem2;
        s = seconds.toInt();
        sec--;
        notifyListeners();
      } else {
        getCurrentPosition();
        timer.cancel();
        Timer(const Duration(seconds: 2), (){
          Navigator.pushReplacementNamed(context, Routes.completeRoute,arguments:CompletedArguments(distance: distance));
        });
      }
    });
  }

  void getCurrentPosition()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      LocationPermission asked = await Geolocator.requestPermission();
    }else{
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best
      );
      if(firstHit) {
          startLat = currentPosition.latitude;
          startLong = currentPosition.longitude;
          firstHit = false;
          notifyListeners();
      }
      distance = Geolocator.distanceBetween(startLat, startLong, currentPosition.latitude, currentPosition.longitude);
      notifyListeners();
    }
  }
}

class CompletedArguments{
 double distance;
 CompletedArguments({required this.distance});
}