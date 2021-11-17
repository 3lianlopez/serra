// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Welcome {
    Welcome({
       required this.empresas,
    });

    List<Empresa> empresas;

    factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        empresas: List<Empresa>.from(json["Empresas"].map((x) => Empresa.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Empresas": List<dynamic>.from(empresas.map((x) => x.toMap())),
    };
}

class Empresa {
    Empresa({
      required this.nombreEmpresa,
      required this.logoEmpresa,
      required this.ruta,
    });

    String nombreEmpresa;
    String logoEmpresa;
    String ruta;

    factory Empresa.fromJson(String str) => Empresa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Empresa.fromMap(Map<String, dynamic> json) => Empresa(
        nombreEmpresa: json["nombreEmpresa"],
        logoEmpresa: json["logoEmpresa"],
        ruta: json["ruta"],
    );

    Map<String, dynamic> toMap() => {
        "nombreEmpresa": nombreEmpresa,
        "logoEmpresa": logoEmpresa,
        "ruta": ruta,
    };
}
