import 'package:adminfo_new/User/repository/lista_empresa_repository.dart';
import 'package:adminfo_new/User/ui/Screens/perfiles_screen.dart';

import 'package:adminfo_new/widgets/card_container.dart';
import 'package:adminfo_new/widgets/icono_empresa.dart';
import 'package:adminfo_new/widgets/image_adminfo_movil_15_widget.dart';

import 'package:flutter/material.dart';

class EmpresaScreen extends StatelessWidget {
  const EmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff31679a),
        title: const Center(
            child: ImageAdminfoMovil15Widget(
          width: 80,
          height: 80,
        )),
      ),
      backgroundColor: const Color(0xfff7f8fb),
      body: Stack(
        children: [
          const CardContainer(
              bottom: 0, top: 20, left: 20, right: 20, child: _ListaEmpresa()),
          Container(
            // padding: const EdgeInsets.only(top: 0, bottom: 10),
            //shape es la sombra
            width: double.infinity,
            height: 80,
            margin: const EdgeInsets.only(top: 625),

            decoration: _createCardShape(),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _createCardShape() => const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/Fondo_card.png'),
          fit: BoxFit.fill,
          alignment: Alignment.bottomCenter),
    );

class _ListaEmpresa extends StatelessWidget {
  const _ListaEmpresa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List> tipoListado;
    tipoListado = listaEmpresas.cargarLista();
    return Column(
      children: [
        const LogoEmpresa(),
        const SizedBox(
          height: 10,
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
        const SizedBox(
          height: 20,
        ),
        _ImageList(
          image: empresas['logoEmpresa'],
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilesScreen(
                    logoEmpresa: empresas['logoEmpresa'].toString(),
                    nombreEmpresa: empresas['nombreEmpresa'].toString(),
                  ),
                ),
              );
            },
            title: Text(
              empresas['nombreEmpresa'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Gotham_medium',
                fontSize: 17,
              ),
            )),
      ],
    );
    lista
      ..add(empresa)
      ..add(const SizedBox(
        height: 10,
      ))
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
