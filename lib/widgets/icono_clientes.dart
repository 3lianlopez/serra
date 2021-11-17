import 'package:flutter/material.dart';

class LogoClientes extends StatelessWidget {
  const LogoClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 52,
        ),
        Image.asset(
          'assets/Perfil.png',
          width: 60,
          height: 60,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'CLIENTES',
          style: TextStyle(
              fontFamily: 'Gotham_bold',
              fontSize: 24,
              color: Color(0xff4D4D4D),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
