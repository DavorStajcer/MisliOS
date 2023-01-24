import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/home/widgets/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
