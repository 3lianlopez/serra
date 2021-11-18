import 'package:adminfo_new/widgets/button_floating_bottomnav.dart';
import 'package:adminfo_new/widgets/card_container.dart';
import 'package:adminfo_new/widgets/image_adminfo_movil_15_widget.dart';
import 'package:adminfo_new/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Padding(
          padding: EdgeInsets.only(top: 50), child: FloatingButton()),
      bottomNavigationBar: const NavBar(),
      backgroundColor: const Color(0xfff7f8fb),
      body: Stack(
        children: [
          CardContainer(
            bottom: 0,
            top: 20,
            left: 20,
            right: 20,
            child: Stack(children: [
              Container(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                //shape es la sombra

                height: 80,
                margin: const EdgeInsets.only(top: 530, bottom: 0),

                decoration: _createCardShape(),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/Adminfo-Movil-06.png',
                    width: 60,
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/Adminfo-Movil-31.png',
                    width: 240,
                    height: 50,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Table(
                      children: const [
                        TableRow(children: [
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-42.png',
                            texto: 'Sincronizar',
                          ),
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-43.png',
                            texto: 'Compromisos',
                          )
                        ]),
                        TableRow(children: [
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-44.png',
                            texto: 'Buscar\n Obligaciones',
                          ),
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-45.png',
                            texto: 'Lista para\n Gestión',
                          ),
                        ]),
                        TableRow(children: [
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-46.png',
                            texto: 'Gestiones\n del día',
                          ),
                          _ImageIcon(
                            image: 'assets/images/Adminfo-Movil-47.png',
                            texto: 'Ruta\n Gestor',
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ImageIcon extends StatelessWidget {
  final String image;
  final String texto;
  const _ImageIcon({Key? key, required this.image, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                buildShowDialog(context);
              },
              child: Image(
                image: AssetImage(image),
                height: 60,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            texto,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

BoxDecoration _createCardShape() => const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/Fondo_card.png'),
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    );

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Image.asset(
            'assets/images/Adminfo-Movil-24.png',
            width: 60,
            height: 60,
          )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          actions: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                    width: 200,
                    child: Text(
                      '¿Estás seguro que deseas sincronizar los datos?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                                'assets/images/Adminfo-Movil-32.png'),
                            height: 30,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                                'assets/images/Adminfo-Movil-33.png'),
                            height: 30,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        );
      });
}
