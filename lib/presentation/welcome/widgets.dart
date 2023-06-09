import 'package:flutter/material.dart';
import 'package:walkmate/presentation/resources/color_manager.dart';

Widget button({required BuildContext context, required String routeName}) {
  return Card(
      color: ColorManager.appPrimaryColor, //#20C56C
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 200,
          child: const Text("Get Started"),
        ),
      ));
}
