// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromMap(jsonString);

import 'dart:convert';

class UsuarioModel {
    UsuarioModel({
       required this.valido,
       required this.msg,
       required this.error,
       required this.redirect,
    });

    bool valido;
    String msg;
    String error;
    String redirect;

    factory UsuarioModel.fromJson(String str) => UsuarioModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        valido: json["valido"],
        msg: json["msg"],
        error: json["error"],
        redirect: json["redirect"],
    );

    Map<String, dynamic> toMap() => {
        "valido": valido,
        "msg": msg,
        "error": error,
        "redirect": redirect,
    };
}
