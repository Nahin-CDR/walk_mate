import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';
import 'package:tracker/presentation/resources/utils_manager.dart';
import 'package:tracker/presentation/set_limit/widgets.dart';
import '../../service/notification_service.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/string_manager.dart';


class SetLimitView extends StatefulWidget {
  const SetLimitView({Key? key}) : super(key: key);

  @override
  State<SetLimitView> createState() => _SetLimitViewState();
}

class _SetLimitViewState extends State<SetLimitView> {

  TextEditingController inputLimit = TextEditingController();
  int takenLimit = 0;
  Future getNotificationPermission()async{
    await NotificationService.initializeNotification();
  }

  @override
  void initState() {
    // TODO: implement initState
    getNotificationPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(ImageAssets.walkMate),
            ),
            Expanded(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      AppString.setLimitTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorManager.appPrimaryColor
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child:  takeInput(
                          mxLen: 2,
                          myHint: AppString.inputFieldHint,
                          myLabelText: AppString.labelText,
                          inputTextController: inputLimit,
                          isPassWord: false
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.appPrimaryColor,
        onPressed: (){
          if(inputLimit.text.isNotEmpty && int.parse(inputLimit.text)<=10){
            setState(() {
              takenLimit = int.parse(inputLimit.text);
            });
            // we will pass this time limit to show counter to next screen as argument
            Navigator.pushNamed(context, Routes.homeRoute,arguments: LimitArgument(limit: takenLimit));
          }else{
            UtilsManager.toastMessage(message: AppString.inputToastWarning);
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
