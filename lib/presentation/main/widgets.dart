import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
Widget animText ({required txt})=>SizedBox(
  child: Container(
    height: 20,
    margin: const EdgeInsets.all(5.0),
    child:  DefaultTextStyle(
      style: const TextStyle(
        color: Color.fromRGBO(216, 113, 16, 1.0),
        fontSize: 12,
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText(txt.toString())
        ],
      ),
    ),
  ),
);