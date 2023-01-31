import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/home/widgets/logo.dart';

class TopNavigationSmall extends StatelessWidget {
  const TopNavigationSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Logo(),
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Icon(
            Icons.menu,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
