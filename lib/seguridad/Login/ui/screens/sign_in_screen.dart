import 'package:adminfo_new/adminfo_icons.dart';

import 'package:adminfo_new/seguridad/Login/providers/login_form_provider.dart';

import 'package:adminfo_new/seguridad/Login/ui/widgets/button_tango_widget.dart';
import 'package:adminfo_new/seguridad/Login/ui/widgets/card_login_widget.dart';

import 'package:flutter/material.dart';

import 'package:adminfo_new/widgets/image_adminfo_movil_15_widget.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Adminfo-Movil-10.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                //centrar elementos de manera vertical
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  const ImageAdminfoMovil15Widget(
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    "Adminfo",
                    style: TextStyle(
                        fontSize: 37.0,
                        fontFamily: 'Gotham Light',
                        color: Colors.white),
                  ),
                  const Text(
                    "MÓVIL",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: 'Gotham Bold',
                      color: Colors.white,
                    ),
                  ),
                  CardLoginWidget(
                      height: 360.0,
                      width: 310.0,
                      marginTop: 60.0,
                      marginBottom: 30.0,
                      child: ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const _LoginForm())),
                  const Text(
                    "Te damos la bienvenida a nuestra app, "
                    "desde la comodidad de tu hogar, en "
                    "cualquier momento y lugar.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Gotham Book',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: unused_element
class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return SingleChildScrollView(
      child: Form(
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                icon: Icon(Adminfo.usuario),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) => loginForm.usuario = value,
              validator: (value) {
                if (value != null && value.isNotEmpty) return null;

                return 'Por favor Ingrese un usuario';
              },
            ),
            const Divider(
              thickness: 2,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Dominio',
                icon: Icon(
                  Adminfo.dominio,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) => loginForm.dominio = value,
              validator: (value) {
                if (value != null && value.isNotEmpty) return null;

                return 'Por favor Ingrese un Dominio';
              },
            ),
            const Divider(
              thickness: 2,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Clave de acceso',
                icon: Icon(Adminfo.password),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 8) return null;

                return 'La clave debe ser de 8 caracteres';
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  shape: BoxShape.rectangle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 15.0,
                        offset: Offset(0.10, 0.10))
                  ]),
              child: ButtonTango(
                buttonText: loginForm.isLoading ? 'Espere' : 'Acceder',
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacementNamed(context, 'Empresas');
                        // final authService =
                        //     Provider.of<AuthService>(context, listen: false);

                        // if (!loginForm.isValidForm()) return;

                        // final String? errorMessage = await authService.login(
                        //     loginForm.usuario, loginForm.password);
                        // if (errorMessage == null) {
                        //   Navigator.pushReplacementNamed(context, 'Empresas');
                        // } else {
                        //   loginForm.isLoading = false;
                        //   buildShowDialog(context, loginForm.isLoading);
                        // }
                      },
                height: 60.0,
                width: 270.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '¿Olvidó su contraseña?',
                  style: TextStyle(fontFamily: 'Gotham Book'),
                ),
                InkWell(
                  child: const Text(
                    '  haga clic aquí',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildShowDialog(BuildContext context, bool isloading) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (isloading == true) {
            return AlertDialog(
              title: const Center(child: Text('Iniciando sesion')),
              actions: [
                Center(
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return AlertDialog(
              title: const Text(
                'Usuario o Contraseña Incorrecta',
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'))
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}
