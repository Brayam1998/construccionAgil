import 'package:app_construccion_agil/src/bloc/provider.dart';
import 'package:app_construccion_agil/src/pages/Datos_page.dart';
import 'package:app_construccion_agil/src/pages/HomePage.dart';
import 'package:app_construccion_agil/src/pages/Productos_page.dart';
import 'package:app_construccion_agil/src/pages/list_Productos_page.dart';
import 'package:app_construccion_agil/src/pages/config_cuenta.dart';
import 'package:app_construccion_agil/src/pages/config_zona.dart';
import 'package:app_construccion_agil/src/pages/contacto.dart';
import 'package:app_construccion_agil/src/pages/login_page.dart';
import 'package:app_construccion_agil/src/pages/Ordenes_page.dart';
import 'package:app_construccion_agil/src/pages/registro_page.dart';
import "package:app_construccion_agil/src/preferenciasUsuario/preferencias_usuario.dart";
import 'package:flutter/material.dart';

import 'src/pages/productos_Edit_page .dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final prefs = new PreferenciasUsuario();
     print(prefs.token);


    return Provider( child: MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login" : (BuildContext context) => LoginPage(),
         "homepage"  : (BuildContext context) => HomePage(),
         "ordenes"   : (BuildContext context) => OrdenesPage(),
         "ListaProductos" : (BuildContext context) => ListProductosPage(),
         "datos"     : (BuildContext context) => DatosPage(),
         "contacto"  : (BuildContext context) => ContactoPage(),
         "zona"      : (BuildContext context) => ZonaPage(),
         "cuenta"    : (BuildContext context) => CuentaPage(),
         "producto" : (BuildContext context) => ProductosPage(),
         "productosEdit" : (BuildContext context) => ProductosEditPage(),
         "registro"  : (BuildContext context) => RegistroPage()
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(4, 50, 60, 1)
          )
    )
    );
     
    
    
  }
}