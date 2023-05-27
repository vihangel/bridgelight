import 'package:flutter/material.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';

class MyBookStoreTheme {
  static ThemeData light() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: MyBookStoreColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: primary),
        actionsIconTheme: const IconThemeData(
          color: MyBookStoreColors.black,
        ),
        centerTitle: true,
        titleTextStyle: MyBookStoreTextStyles.titleAppBar,
      ),
      primarySwatch: primary,
      scaffoldBackgroundColor: MyBookStoreColors.white,
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      //         const EdgeInsets.all(16)),
      //     textStyle: MaterialStateProperty.all<TextStyle>(
      //         MyBookStoreTextStyles.labelLarge),
      //   ),
      // ),

      buttonTheme: const ButtonThemeData(
        padding: EdgeInsets.all(16),
        buttonColor: MyBookStoreColors.black,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: MyBookStoreColors.subtitleLight,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: MyBookStoreColors.subtitleLight,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: MyBookStoreColors.subtitleLight,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        labelStyle: MyBookStoreTextStyles.labelMedium,
        // hintStyle: TextStyles.regular,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
      // textTheme: const TextTheme(),
    );
  }
}
