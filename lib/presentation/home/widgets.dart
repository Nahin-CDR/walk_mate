import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
Widget animText ({required txt})=>SizedBox(
  child: Container(
    height: 50,
    margin: const EdgeInsets.all(5.0),
    child:  DefaultTextStyle(
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
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


