import 'package:flutter/material.dart';
import 'package:adminfo_new/widgets/image_adminfo_movil_11_widget.dart';

class CardLoginWidget extends StatelessWidget {
  final double height;
  final double width;
  final double marginTop;
  final double marginBottom;
  final Widget child;

  const CardLoginWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.marginTop,
      required this.marginBottom,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    final card = Container(
      padding: const EdgeInsets.all(20.0),
      height: height,
      width: width,
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
      child: child,
    );

    return Stack(
      //alinear con respecto al centro del widget back
      alignment: const Alignment(0, -0.8),
      children: <Widget>[
        card,
        const ImageAdminfoMovil11Widget(),
      ],
    );
  }
}
