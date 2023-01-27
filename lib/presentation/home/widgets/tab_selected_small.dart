import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
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
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Text(
        homeTab.text,
        style: AppTextStyles.tabText.copyWith(color: Colors.white),
      ),
    );
  }
}
