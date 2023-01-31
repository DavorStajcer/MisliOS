import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class TabHovered extends StatelessWidget {
  final HomeTab homeTab;
  const TabHovered(
    this.homeTab, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: AppColors.secondary,
          ),
        ),
      ),
      child: Text(
        homeTab.text,
        style: AppTextStyles.tabText.copyWith(color: Colors.white),
      ),
    );
  }
}
