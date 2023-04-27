import 'package:flutter/material.dart';
import 'package:tracker/presentation/completed_walk/widgets.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';
import 'package:tracker/presentation/resources/color_manager.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import '../resources/routes_manager.dart';
class CompletedView extends StatefulWidget {
  final String totalDistance;
  const CompletedView({required this.totalDistance,Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CompletedView> createState() => _CompletedViewState(travelledDistance: totalDistance);
}

class _CompletedViewState extends State<CompletedView> {
  final String travelledDistance;
  _CompletedViewState({required this.travelledDistance});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                  AppString.goalCompletion,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            Container(
              margin:const EdgeInsets.only(left: 20,bottom: 20),
              child: Text("${AppString.travelledDistance}: $travelledDistance m"),
            ),
            Center(
              child: Image.asset(
                  ImageAssets.congrats,
                  height: 150,
                  width: 150
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text("Congratulations on reaching your Target",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ColorManager.appPrimaryColor
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: navToSetLimitButton(context:context,routeName: Routes.setLimit),
            )
          ],
        ),
      ),
    );
  }
}
