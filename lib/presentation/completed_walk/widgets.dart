import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/color_manager.dart';
Widget navToSetLimitButton({required BuildContext context,required String routeName}){
  return Card(
      color: ColorManager.appPrimaryColor,//#20C56C
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context,routeName);
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 200,
          child: const Text("Go Back"),
        ),
      )
  );
}