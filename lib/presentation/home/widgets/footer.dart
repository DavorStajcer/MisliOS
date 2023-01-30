import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:misli_os_app/presentation/common/util/html_redirect.dart';
import 'package:misli_os_app/presentation/common/values/app_images.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_icon.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => HtmlRedirect.redirectoToUrl(
                    'https://www.facebook.com/profile.php?id=100085498653827'),
                child: const HoverIcon(
                  FontAwesomeIcons.facebook,
                  hoveredColor: Colors.black54,
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => HtmlRedirect.redirectoToUrl(
                    'https://www.instagram.com/mislios/'),
                child: const HoverIcon(
                  FontAwesomeIcons.instagram,
                  hoveredColor: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => HtmlRedirect.redirectoToUrl(
                'mailto:${'udrugamislios@gmail.com'}'),
            child: HoverText(
              'udrugamislios@gmail.com',
              style: AppTextStyles.normal,
              hoveredStyle:
                  AppTextStyles.normal.copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
