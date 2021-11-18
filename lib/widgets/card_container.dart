import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final double bottom;
  final double top;
  final double left;
  final double right;
  final Widget child;

  const CardContainer(
      {Key? key,
      required this.bottom,
      required this.left,
      required this.right,
      required this.top,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //separacion a los lados
      padding:
          EdgeInsets.only(bottom: bottom, top: top, left: left, right: right),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          //shape es la sombra
          decoration: _createCardShape(),

          child: child,
        ),
      ]),
    );
  }

  BoxDecoration _createCardShape() => const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            // bottomLeft: Radius.circular(25),
            // bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            //sombra
            BoxShadow(
              color: Colors.black12,
              //efecto como borrado
              blurRadius: 15,
              //posicion de la sombra
              offset: Offset(0, 5),
            )
          ]);
}
