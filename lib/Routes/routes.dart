import 'package:adminfo_new/User/ui/Screens/clientes_screen.dart';
import 'package:adminfo_new/User/ui/Screens/empresas_screen.dart';
import 'package:adminfo_new/User/ui/Screens/menu_screen.dart';
import 'package:adminfo_new/User/ui/Screens/perfiles_screen.dart';
import 'package:adminfo_new/seguridad/Login/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const SignInScreen(),
    'Empresas': (BuildContext context) => const EmpresaScreen(),
    'Perfiles': (BuildContext context) => const PerfilesScreen(),
    'Menu': (BuildContext context) => const MenuScreen(),
    'Clientes': (BuildContext context) => const ClientesScreen(),
  };
}
