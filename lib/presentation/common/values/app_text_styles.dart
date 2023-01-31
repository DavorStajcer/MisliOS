import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/app_fonts.dart';

abstract class AppTextStyles {
  static const TextStyle tabText = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.delaGothicOneRegular,
    color: Colors.white,
  );
  static TextStyle logo = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.kgSummerSunshineShadow,
    color: Colors.white.withOpacity(0.8),
  );

  static const TextStyle homeStat = TextStyle(
    fontSize: 22,
    color: Colors.white,
    fontFamily: AppFonts.delaGothicOneRegular,
  );

  static const TextStyle eventTitle = TextStyle(
    fontSize: 30,
    fontFamily: AppFonts.delaGothicOneRegular,
    color: Colors.white,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.delaGothicOneRegular,
    color: Colors.white,
  );
}
