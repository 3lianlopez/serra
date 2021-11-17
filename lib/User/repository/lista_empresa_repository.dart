import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ListaEmpresas {
  List<dynamic> listado = [];

  _ListaEmpresas() {
    cargarLista();
  }

  Future<List<dynamic>> cargarLista() async {
    final resp = await rootBundle.loadString('data/ListaEmpresas.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['Empresas']);
    listado = dataMap['Empresas'];
    return listado;
  }

  Future<List<dynamic>> cargarPerfil() async {
    final resp = await rootBundle.loadString('data/ListaEmpresas.json');
    Map dataMap = json.decode(resp);

    listado = dataMap['Perfiles'];

    return listado;
  }

  Future<List<dynamic>> cargarClientes() async {
    final resp = await rootBundle.loadString('data/ListaEmpresas.json');
    Map dataMap = json.decode(resp);

    listado = dataMap['Clientes'];

    return listado;
  }

  Future<List<dynamic>> cargarUsuarios() async {
    final resp = await rootBundle.loadString('data/ListaEmpresas.json');
    Map dataMap = json.decode(resp);

    listado = dataMap['Usuarios'];

    return listado;
  }
}

final listaEmpresas = _ListaEmpresas();
