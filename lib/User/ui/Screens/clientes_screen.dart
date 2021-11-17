import 'package:adminfo_new/User/repository/lista_empresa_repository.dart';
import 'package:adminfo_new/widgets/button_floating_bottomnav.dart';

import 'package:adminfo_new/widgets/card_container.dart';
import 'package:adminfo_new/widgets/icono_clientes.dart';
import 'package:adminfo_new/widgets/image_adminfo_movil_15_widget.dart';

import 'package:adminfo_new/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff31679a),
        title: const Center(
            child: ImageAdminfoMovil15Widget(
          width: 80,
          height: 80,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Padding(
          padding: EdgeInsets.only(top: 50), child: FloatingButton()),
      bottomNavigationBar: const NavBar(),
      backgroundColor: const Color(0xfff7f8fb),
      body: const CardContainer(
          bottom: 50, top: 20, left: 20, right: 20, child: _ListaEmpresa()),
    );
  }
}

class _ListaEmpresa extends StatelessWidget {
  const _ListaEmpresa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List> tipoListado;
    tipoListado = listaEmpresas.cargarClientes();
    return Column(
      children: [
        const LogoClientes(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder(
              future: tipoListado,
              initialData: const [],
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return ListView(
                  shrinkWrap: true,
                  children: _listView(snapshot.data!, context),
                );
              }),
        ),
      ],
    );
  }
}

List<Widget> _listView(List<dynamic> data, context) {
  final List<Widget> lista = [];

  for (var empresas in data) {
    final empresa = Row(
      children: [
        const SizedBox(
          height: 20,
          width: 20,
        ),
        _ImageList(
          image: empresas['logoCliente'],
        ),
        const SizedBox(
          height: 20,
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Nit: ',
                  style: TextStyle(
                      fontFamily: 'Gotham Medium',
                      fontSize: 13,
                      color: Color(0xff474747)),
                ),
                Text(empresas['nit'],
                    style: const TextStyle(
                      fontFamily: 'Gotham Book',
                    ))
              ],
            ),
            Row(
              children: [
                const Text(
                  'Cliente: ',
                  style: TextStyle(
                      fontFamily: 'Gotham Medium',
                      fontSize: 13,
                      color: Color(0xff474747)),
                ),
                Text(empresas['cliente'],
                    style: const TextStyle(
                      fontFamily: 'Gotham Book',
                    ))
              ],
            ),
            Row(
              children: [
                const Text(
                  'Nro suscripción: ',
                  style: TextStyle(
                      fontFamily: 'Gotham Medium',
                      fontSize: 13,
                      color: Color(0xff474747)),
                ),
                Text(empresas['nroSuscripcion'],
                    style: const TextStyle(
                      fontFamily: 'Gotham Book',
                    ))
              ],
            ),
            Row(
              children: [
                const Text(
                  'Valor pendiente suscripción: ',
                  style: TextStyle(
                      fontFamily: 'Gotham Medium',
                      fontSize: 13,
                      color: Color(0xff474747)),
                ),
                Text(empresas['valorPendiente'],
                    style: const TextStyle(
                      fontFamily: 'Gotham Book',
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
    lista
      ..add(empresa)
      ..add(const Divider(
        endIndent: 20.0,
        indent: 20.0,
        color: Color(0xff9a9a9a),
      ));
  }
  return lista;
}

class _ImageList extends StatelessWidget {
  final String image;

  const _ImageList({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _borderImage(),
      child: ClipOval(
        child: CircleAvatar(
          maxRadius: 25,
          minRadius: 25,
          backgroundColor: Colors.white,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

BoxDecoration _borderImage() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(50.0),
    border: Border.all(width: 1.0, color: const Color(0xffE2E2E2)),
  );
}
