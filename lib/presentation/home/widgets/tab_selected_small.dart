import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class TabSelectedSmall extends StatelessWidget {
  final HomeTab homeTab;
  const TabSelectedSmall(
    this.homeTab, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
      ),
      child: Text(
        homeTab.text,
        style: AppTextStyles.tabText.copyWith(color: Colors.white),
      ),
    );
  }
}
