import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: 150.0,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 5),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xfff48220),
            child: Image.asset('assets/Home_ico.png'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
