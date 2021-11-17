import 'package:flutter/material.dart';

class ButtonTango extends StatefulWidget{

  final String buttonText ;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  const ButtonTango({Key? key, required this.buttonText, required this.onPressed, required this.height, required this.width}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _ButtonTango();
  }

}

class _ButtonTango extends State<ButtonTango>{

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(

        height: widget.height,
        width: widget.width,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color(0xFFF48220),
        ),

        child: Center(
          child: Text(
            widget.buttonText,
            style: const TextStyle(
                fontSize: 18.0,
                fontFamily: "Gotham Medium",
                color: Colors.white
            ),
          ),
        ),

      ),
    );
  }

}