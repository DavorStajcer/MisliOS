import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/home/widgets/home_screen.dart';

class HomeLocation extends BeamLocation {
  HomeLocation();

  @override
  List<Pattern> get pathPatterns => ['/'];

  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
          key: ValueKey('home'),
          child: HomeScreen(),
        ),
      ];
}
