import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/presentation/main/main_view_model.dart';
import 'package:tracker/presentation/main/widgets.dart';
class MainView extends StatefulWidget {
  final int limit;
  const MainView({required this.limit,Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<MainView> createState() => _MainViewState(walkLimit: limit);
}
List checkPoints = [];
class _MainViewState extends State<MainView> {
  final int walkLimit;
  MainViewModel mainViewModel = MainViewModel();
  _MainViewState({required this.walkLimit});

  @override
  void initState(){
    // TODO: implement initState
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
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
                               height: 30,
                               child: animText(txt: "Tracking now : "),
                             )
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