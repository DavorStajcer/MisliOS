import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_svgs.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class NavigationErrorPage extends StatelessWidget {
  const NavigationErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvgs.maskotaCrnoBijelo),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Error going to this route',
              style:
                  AppTextStyles.homeStat.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.go('/'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.secondary)),
              child: Text(
                'Home page',
                style: AppTextStyles.normal.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
