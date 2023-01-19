import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/beam_nav/home_location.dart';
import 'package:misli_os_app/firebase_options.dart';

void main(List<String> args) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MisliOsApp(),
    ),
  );
}

class MisliOsApp extends StatelessWidget {
  const MisliOsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        locationBuilder: (routeInformation, beamParametetrs) => HomeLocation(),
      ),
    );
  }
}
