import 'package:adminfo_new/User/repository/lista_empresa_repository.dart';

import 'package:adminfo_new/widgets/card_container.dart';
import 'package:adminfo_new/widgets/icono_perfil.dart';
import 'package:adminfo_new/widgets/image_adminfo_movil_15_widget.dart';

import 'package:flutter/material.dart';

class PerfilesScreen extends StatelessWidget {
  final String? logoEmpresa;
  final String? nombreEmpresa;
  const PerfilesScreen({
    Key? key,
    this.logoEmpresa,
    this.nombreEmpresa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xff31679a),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: ImageAdminfoMovil15Widget(
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xfff7f8fb),
      body: Stack(children: [
        CardContainer(
          bottom: 0,
          top: 20,
          left: 20,
          right: 20,
          child: _ListaPerfil(
            logoEmpresa: logoEmpresa,
            nombreEmpresa: nombreEmpresa,
          ),
        ),
        Container(
          // padding: const EdgeInsets.only(top: 0, bottom: 10),
          //shape es la sombra
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.only(top: 625),
          // color: Colors.red,
          decoration: _createCardShape(),
        ),
      ]),
    );
  }
}

BoxDecoration _createCardShape() => const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/Fondo_card.png'),
          fit: BoxFit.fill,
          alignment: Alignment.bottomCenter),
    );

class _ListaPerfil extends StatelessWidget {
  final String? logoEmpresa;
  final String? nombreEmpresa;

  const _ListaPerfil({
    Key? key,
    this.logoEmpresa,
    this.nombreEmpresa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List> tipoListado;
    tipoListado = listaEmpresas.cargarPerfil();
    return Column(
      children: [
        const LogoPerfil(),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Container(
              child: logoEmpresa != null
                  ? Image.asset(
                      logoEmpresa!,
                      width: 100,
                      height: 80,
                    )
                  : null,
            ),
            Container(
                child: nombreEmpresa != null
                    ? Text(
                        nombreEmpresa!,
                        style: const TextStyle(
                            fontFamily: 'Gotham Bold',
                            fontSize: 18,
                            color: Color(0xff474747)),
                      )
                    : null)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder(
              future: tipoListado,
              initialData: const [],
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 60),
                  child: ListView(
                    shrinkWrap: true,
                    children: _listView(snapshot.data!, context),
                  ),
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
    final empresa = Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ClipOval(
                child: Image.asset(
                  empresas['perfil'],
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  empresas['subtitle'],
                  style: const TextStyle(
                      color: Colors.black45,
                      fontFamily: 'Gotham_book',
                      fontSize: 10),
                ),
                Text(
                  empresas['nombre'],
                  style: const TextStyle(
                      fontFamily: 'Gotham_medium', fontSize: 13),
                )
              ],
            )
          ],
        )
      ],
    );
    lista
      ..add(empresa)
      ..add(const Divider(
        endIndent: 30.0,
        indent: 40.0,
        color: Color(0xff9a9a9a),
      ));
  }
  return lista;
}

// ignore: unused_element
class _ImageList extends StatelessWidget {
  final String image;

  const _ImageList({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _borderImage(),
      child: ClipOval(
        child: CircleAvatar(
          maxRadius: 35,
          minRadius: 35,
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
