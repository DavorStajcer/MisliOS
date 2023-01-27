import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:misli_os_app/presentation/common/values/app_images.dart';
import 'package:misli_os_app/presentation/common/values/app_text_styles.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_icon.dart';
import 'package:misli_os_app/presentation/common/widgets/hover_text.dart';

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
            children: const [
              HoverIcon(
                FontAwesomeIcons.facebook,
                hoveredColor: Colors.black54,
              ),
              SizedBox(width: 20),
              HoverIcon(
                FontAwesomeIcons.instagram,
                hoveredColor: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 20),
          HoverText(
            'udrugamislios@gmail.com',
            style: AppTextStyles.normal,
            hoveredStyle: AppTextStyles.normal.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
