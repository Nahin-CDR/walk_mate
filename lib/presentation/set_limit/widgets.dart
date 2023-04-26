import 'package:flutter/material.dart';

Widget takeInput({
  required int mxLen,
  required String myHint,
  required String myLabelText,
  required TextEditingController inputTextController,
  required bool isPassWord}) {
  return TextField(
    maxLength: mxLen,
    keyboardType: TextInputType.number,
    controller: inputTextController,
    obscureText: isPassWord,
    decoration: InputDecoration(
        labelText: myLabelText.toString(),
        hintText: myHint.toString(),
        hintStyle: const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 38),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.3), width: 1),
          //Color(0xFFF1F1F1)),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromRGBO(42, 51, 84, .8), width: 1),
          //Color(0xFFC7C7C7)),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        )
    ),
  );
}