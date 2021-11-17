import 'package:flutter/material.dart';

class ImageAdminfoMovil15Widget extends StatelessWidget {
  final double? width;
  final double? height;

  const ImageAdminfoMovil15Widget({
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        // width: width,
        child: Image.asset(
      'assets/images/Adminfo-Movil-15.png',
      height: height,
      width: width,
    ));
}
