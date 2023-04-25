import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracker/presentation/resources/utils_manager.dart';
import '../resources/routes_manager.dart';


class SetLimitView extends StatefulWidget {
  const SetLimitView({Key? key}) : super(key: key);

  @override
  State<SetLimitView> createState() => _SetLimitViewState();
}

class _SetLimitViewState extends State<SetLimitView> {

  TextEditingController inputLimit = TextEditingController();
  int lim = 0;
  void askedForLocationPermission()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      LocationPermission asked = await Geolocator.requestPermission();
    }else{
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    askedForLocationPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Set A time limit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            TextField(
              decoration: InputDecoration(
                label: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text("Enter your walking time in minutes"),
                )
              ),
              keyboardType: TextInputType.number,
              controller: inputLimit,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(inputLimit.text.isNotEmpty && int.parse(inputLimit.text)<=10){
            setState(() {
              lim = int.parse(inputLimit.text);
            });
            Navigator.pushNamed(context, Routes.mainRoute,arguments: LimitArgument(limit: lim));
          }else{
            UtilsManager.toastMessage(message: "input time between 1-10 minutes");
          }
        },
        child: const Icon(Icons.near_me),
      ),
    );
  }
}

class LimitArgument{
  final int limit;
  LimitArgument({required this.limit});
}
