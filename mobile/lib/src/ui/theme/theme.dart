

import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';

import 'font.dart';

enum AppTheme { LightTheme, DarkTheme }

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    hoverColor: body,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: body
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 1,
       focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: red,
          width: 1.5,

        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: milkShake,
          width: 1.5,

        )
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: red,

        )
      ),
      errorStyle: TextStyle(color: red)
    ),
      primaryColor: primary,
      buttonColor: white,
      scaffoldBackgroundColor: body,
      appBarTheme: AppBarTheme(backgroundColor: body, foregroundColor: text),
      primaryColorDark: secondary,
      iconTheme: IconThemeData(color: sub_text),
      fontFamily: font.fontFamily,
      disabledColor: light_button,
      cardColor: primary,
      textTheme: const TextTheme(
        titleLarge:
            TextStyle(color: text, fontSize: 20, fontWeight: FontWeight.bold),
        titleMedium:
            TextStyle(color: text, fontSize: 16, fontWeight: FontWeight.w700),// title
        titleSmall:
            TextStyle(color: text, fontSize: 14, fontWeight: FontWeight.w600),//pickupDeliveryListAddress
        bodySmall: TextStyle(
            color: sub_text, fontSize: 12, fontWeight: FontWeight.w400),//pickupDeliveryListTitle
        labelSmall: TextStyle(
            color: sub_text, fontSize: 10, fontWeight: FontWeight.w400),// pickupDeliveryPaymentTitle
        labelMedium:
            TextStyle(color: text, fontSize: 12, fontWeight: FontWeight.w600),// pickupDeliveryPaymentValue
      ),
      brightness: Brightness.light,
      bottomAppBarTheme: const BottomAppBarTheme(color: white, surfaceTintColor: body),
      ),
  AppTheme.DarkTheme: ThemeData(
  )
};

