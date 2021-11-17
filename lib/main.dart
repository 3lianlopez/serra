import 'package:adminfo_new/seguridad/Login/providers/login_form_provider.dart';
import 'package:adminfo_new/seguridad/Login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:adminfo_new/seguridad/Login/bloc/bloc_authentication.dart';

import 'package:adminfo_new/seguridad/Login/ui/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import 'Routes/routes.dart';

void main() {
  runApp( const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService(),
         )
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: getApplicationRoutes(),
          //cuando la ruta no se define se ejecuta este evento
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => const SignInScreen());
          },
        ),
        bloc: BlocAuthentication());
  }
}
