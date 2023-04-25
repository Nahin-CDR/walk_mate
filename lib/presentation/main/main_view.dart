import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:tracker/main.dart';
import 'package:tracker/presentation/main/main_view_model.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/utils_manager.dart';
class MainView extends StatefulWidget {
  final int limit;
  const MainView({
    required this.limit,
    Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<MainView> createState() => _MainViewState(walkLimit: limit);
}
double startLat = 0.0;
double startLong = 0.0;
double endLat = 0.0;
double endLong = 0.0;
bool countDown = false;
double distance = 0.0;
bool firstHit = false;
List checkPoints = [];
int checkPointCounter = 1;
class _MainViewState extends State<MainView> {
  final int walkLimit;
  MainViewModel mainViewModel = MainViewModel();
  _MainViewState({required this.walkLimit});
  int finalWalkLimit = -1;
  void getCurrentPosition()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      LocationPermission asked = await Geolocator.requestPermission();
    }else{
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best
      );
      if(firstHit) {
        setState(() {
          startLat = currentPosition.latitude;
          startLong = currentPosition.longitude;
          firstHit = false;
        });
      }
      // } else{
      //   setState(() {
      //     endLat = currentPosition.latitude;
      //     endLong = currentPosition.longitude;
      //   });
      // }
       setState(() {

       distance = Geolocator.distanceBetween(startLat, startLong, currentPosition.latitude, currentPosition.longitude);
       // _streamController.sink.add(distance);
      });
    }
  }
  // void startTimer(){
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (finalWalkLimit>=0) {
  //      setState(() {
  //        finalWalkLimit--;
  //      });
  //     }else{
  //       getCurrentPosition();
  //       timer.cancel();
  //       UtilsManager.toastMessage(message: AppString.goalCompletionToast);
  //       _startDelay();
  //     }
  //   });
  // }
  // Timer? _timer;
  // _startDelay(){
  //   _timer = Timer(const Duration(seconds: 2), () {
  //   _goNext();
  //   });
  // }

  // _goNext(){
  //   Navigator.pushReplacementNamed(context, Routes.completeRoute);
  // }
  @override
  void initState() {
    // TODO: implement initState
    mainViewModel.startCountDown(second:walkLimit*60,context:context);
    mainViewModel.getCurrentPosition();
    setState((){
      checkPoints.clear();
      //finalWalkLimit = walkLimit*60;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                 margin: const EdgeInsets.all(20),
                 child: ChangeNotifierProvider<MainViewModel>(
                   create: (BuildContext context)=>mainViewModel,
                   child: Consumer<MainViewModel>(
                     builder: (context,provider,child){
                       return Container(
                         height: 200,
                         margin: const EdgeInsets.only(left: 20),
                         child: Column(
                           children: [
                             Text(
                               'Time remaining ${mainViewModel.m} : ${mainViewModel.s}',
                               style: const TextStyle(
                                   fontSize: 12,
                                   color: Colors.blueGrey
                               ),
                             ),
                             Container(
                                 margin: const EdgeInsets.all(10),
                                 child:  Text("Tracking now : ${mainViewModel.distance.toDouble().toStringAsFixed(2)} m",
                                     style: const TextStyle(
                                         color: Colors.black,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold
                                     )
                                 )
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 )
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: checkPoints.length,
                        itemBuilder:(context,index){
                          return Container(
                            //padding: EdgeInsets.only(left: 20,right: 20),
                            margin: const EdgeInsets.only(left: 20,right: 20),
                            height: 50,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("CheckPoint ${index+1}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey
                                      )
                                    ),
                                    Text(" ${checkPoints[index]} ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold
                                      )
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.grey
                                )
                              ]
                            )
                          );
                        }
                    )
                )
              ],
            ),
            floatingActionButton: SizedBox(
              width: 210,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                    ),
                    onPressed: (){
                      mainViewModel.getCurrentPosition();
                      String currentDistance = mainViewModel.distance.toDouble().toStringAsFixed(2);
                      setState((){
                        checkPoints.add(currentDistance);
                      });
                    },
                    child: const Text("Add CheckPoint"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange, // Background color
                    ),
                    onPressed: (){
                      mainViewModel.startCountDown(second: -1, context: context);
                    },
                    child: const Text("Stop"),
                  )
                ],
              ),
            )
        )
    );
  }
}