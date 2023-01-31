import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:misli_os_app/domain/interactors/stats_provider/stats_provider.dart';
import 'package:misli_os_app/domain/interactors/tabs_provider/tabs_provider.dart';
import 'package:misli_os_app/presentation/common/values/app_colors.dart';
import 'package:misli_os_app/presentation/common/values/app_strings.dart';
import 'package:misli_os_app/presentation/common/values/app_svgs.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';

class HomePageReload extends ConsumerWidget {
  final String errorMessage;
  const HomePageReload(
    this.errorMessage, {
    super.key,
  });

  _reloadHomePageData(WidgetRef ref) async {
    await ref.read(statsNotifierProvider.notifier).reloadHomePage();
    await ref.read(tabsNotifierProbider.notifier).reloadHomePage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgs.maskotaCrnoBijelo),
          const SizedBox(
            height: 50,
          ),
          Text(
            errorMessage,
            style: AppTextStyles.homeStat.copyWith(color: AppColors.secondary),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _reloadHomePageData(ref),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.secondary),
            ),
            child: Text(
              AppStrings.reloadPage,
              style: AppTextStyles.normal.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
