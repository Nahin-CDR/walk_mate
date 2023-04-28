import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UtilsManager {
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.brown,
        content: Text(message.toString()))
    );
  }



  static toastMessage({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.brown,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG
    );
  }
}
