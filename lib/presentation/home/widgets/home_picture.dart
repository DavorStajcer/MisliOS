import 'package:flutter/material.dart';

class HomePicture extends StatelessWidget {
  const HomePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/2/21/Trg_sv._Trojstva_Osijek.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
