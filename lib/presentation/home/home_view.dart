import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/presentation/home/widgets.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';

import '../resources/color_manager.dart';
import 'home_view_model.dart';
class HomeView extends StatefulWidget {
  final int limit;
  const HomeView({required this.limit,Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<HomeView> createState() => _HomeViewState(walkLimit: limit);
}
List checkPoints = [];
class _HomeViewState extends State<HomeView> {
  final int walkLimit;
  HomeViewModel mainViewModel = HomeViewModel();
  _HomeViewState({required this.walkLimit});

  @override
  void initState(){
    // TODO: implement initState
    // we will call to startCountdown method to show the remaining time
    mainViewModel.startCountDown(second:walkLimit*60,context:context);
    mainViewModel.getCurrentPosition();
    mainViewModel.setNotification(walkLimit: walkLimit);
    setState((){
      checkPoints.clear();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: ChangeNotifierProvider<HomeViewModel>(
                    create: (BuildContext context)=>mainViewModel,
                    child: Consumer<HomeViewModel>(
                      builder: (context,provider,child){
                        return SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                height: 20,
                                child: Text(
                                  'Time remaining ${mainViewModel.m} : ${mainViewModel.s}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: ColorManager.appPrimaryColor
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on,size: 15,),
                                    animText(txt: "Tracking now : ")
                                  ],
                                ),
                              ),
                              const Text("Your check points "),
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
                            margin: const EdgeInsets.only(left: 20,right: 20),
                            height: 50,
                            child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(ImageAssets.checkPoint,height: 20),
                                      Text("CheckPoint ${index+1}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey
                                          )
                                      ),
                                      Text(" ${checkPoints[index]} m",
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
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 210,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                  color: ColorManager.appPrimaryColor,//#20C56C
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: (){
                      mainViewModel.getCurrentPosition();
                      String currentDistance = mainViewModel.distance.toDouble().toStringAsFixed(2);
                      setState((){
                        checkPoints.add(currentDistance);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 200,
                      child: const Text("Add CheckPoint"),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}