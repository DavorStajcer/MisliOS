import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class TabUnselected extends StatelessWidget {
  final HomeTab homeTab;
  const TabUnselected(
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
      child: Text(
        homeTab.text,
        style: AppTextStyles.tabText,
      ),
    );
  }
}
