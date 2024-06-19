// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Color themeColor = Colors.amber;

const Color shadowGray = Color(0xffD5D9DF);
const Color highlightGray = Color(0xffEBECF0);
const Color drawerGray = Color(0xffF4F5F7);
const Color letterGray = Color(0xff505F79);
const Color utilsContainerGray = Color(0xffFAFBFC);
const Color buttonLightBlue = Color(0xff0065FF);
const Color buttonDarkBlue = Color(0xff0052CC);
const Color linkTextBlue = Color(0xff0052CC);

const List<Shadow> shadow = <Shadow>[
  Shadow(offset: Offset(2, 2), blurRadius: 3)
];

const Duration kAnimDuraction = Duration(milliseconds: 350);
const Cubic kAnimCurve = Curves.easeOut;

InputDecorationTheme kTextFieldDecorationTheme(Color color) {
  return InputDecorationTheme(
    labelStyle: const TextStyle(fontSize: 14),
    hintStyle: const TextStyle(fontSize: 17),
    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.withOpacity(0.5), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.withOpacity(0.8), width: 3),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}

BoxDecoration kContainerDecoration(Color? bgColor) => BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(8)), color: bgColor);

InputDecoration kTextFieldDecoration(ThemeData theme) {
  return InputDecoration().applyDefaults(theme.inputDecorationTheme);
}

InputDecoration kTextFieldHint(ThemeData theme, {String? hint}) {
  return InputDecoration()
      .applyDefaults(theme.inputDecorationTheme)
      .copyWith(hintText: hint);
}

const InputDecoration kDropDownDecoration = InputDecoration(
    labelStyle: TextStyle(
      fontSize: 18,
      //color: kHighlightColour,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x00000000)),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ));

final buttonStyle = ButtonStyle(
  padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);
