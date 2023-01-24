import 'package:flutter/material.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/presentation/common/values/text_styles.dart';

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
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: Colors.blue,
          ),
        ),
      ),
      child: Text(
        homeTab.text,
        style: TextStyles.tabText,
      ),
    );
  }
}
