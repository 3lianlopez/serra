import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;
  final String logo;

  const Logo({Key? key, required this.text, required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          logo,
          width: 60,
          height: 60,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'Gotham_bold',
              fontSize: 24,
              color: Color(0xff4D4D4D),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
