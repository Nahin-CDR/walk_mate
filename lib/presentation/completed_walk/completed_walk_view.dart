import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import '../../service/notification_service.dart';
import '../resources/routes_manager.dart';
class CompletedView extends StatefulWidget {
  final String totalDistance;
  const CompletedView({
    required this.totalDistance,
    Key? key}) : super(key: key);

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
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            Container(
              margin:const EdgeInsets.only(left: 20,bottom: 20),
              child: Text("Total Travelled distance : $travelledDistance m"),
            ),
            Center(
              child: Image.asset(ImageAssets.completedImage,height: 150,width: 150,),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),  // radius of 10
                  color: Colors.green.withOpacity(.5)  // green as background color
              ),
              margin: const EdgeInsets.all(20),
              child: Card(
                child: SizedBox(
                  height: 30,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, Routes.setLimit);
                    },
                    child: const Center(
                        child: Text("Go back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
