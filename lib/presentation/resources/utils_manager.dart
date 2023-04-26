import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UtilsManager {
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.brown,
        content: Text(message.toString()))
    );
  }

  static void flushBarMessage({
    required String titleMessage,
    required String message,
    required BuildContext context,
    required int duration}){
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        borderRadius: BorderRadius.circular(20.0),
        forwardAnimationCurve: Curves.slowMiddle,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        message: message,
        messageColor: Colors.white,
        backgroundColor: Colors.brown,
        title: titleMessage,
        duration: Duration(seconds: duration),
        reverseAnimationCurve: Curves.easeOut,
        titleColor: Colors.white,
        icon: const Icon(Icons.account_balance_wallet_outlined,
            color: Colors.white),
      )..show(context),
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
