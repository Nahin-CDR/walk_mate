import 'dart:async';
import 'package:flutter/material.dart';
import 'package:walkmate/presentation/resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

/*
Plan :
At first this screen will be opened then
after 2 seconds we will go to Welcome screen
 */

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () {
      _goNext();
    });
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.welcome);
  }

  @override
  void initState() {
    // TODO: implement initState
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
