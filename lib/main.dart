import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/app/app_enviroment.dart';
import 'package:misli_os_app/app/app_widget.dart';
import 'package:misli_os_app/common/firebase_options.dart';

mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  killAppWhenErrorInProduction();
  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}

void killAppWhenErrorInProduction() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
}
