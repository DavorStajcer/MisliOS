import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_fonts.dart';

abstract class AppHtmlStyles {
  static final Map<String, Style> mainStyle = {
    'p': Style(
      margin: Margins.zero,
      fontFamily: AppFonts.delaGothicOneRegular,
      color: Colors.white,
    ),
    'b': Style(color: AppColors.ternary),
    'a': Style(color: AppColors.ternary),
  };
}
