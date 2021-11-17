import 'package:flutter/material.dart';

class ImageAdminfoMovil10Widget extends StatelessWidget{

  const ImageAdminfoMovil10Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Image(
      fit: BoxFit.cover,
      image: AssetImage('assets/images/Adminfo-Movil-10.png'),
    );

}