import 'package:flutter/material.dart';

import 'package:app_construccion_agil/src/pages/Datos_page.dart';
import 'package:app_construccion_agil/src/pages/Ordenes_page.dart';
import 'package:app_construccion_agil/src/pages/list_Productos_page.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_shipping)), 
                Tab(icon: Icon(Icons.domain)),
                Tab(icon: Icon(Icons.data_usage)),
              ],
            ),
            title: Text('Construcción Ágil'),
            backgroundColor: Color.fromRGBO(4, 50, 60, 1)
          ),
          body: 

           TabBarView(
            children: [
              OrdenesPage(),
              ListProductosPage(),
              DatosPage(),
            ],
          ),
          drawer :crearDrawer(context),

        ),
      ),
    );
  }
  Widget crearDrawer(BuildContext context){
   return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Configuración', style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Color.fromRGBO(250, 75, 30, 1),
              ),
            ),
            ListTile(
              title: Text('Cuenta'),
              onTap: () {
                Navigator.pushNamed(context, "cuenta");
              },
            ),
            ListTile(
              title: Text('Zona'),
              onTap: () {
                Navigator.pushNamed(context, "zona");
              },
            ),
            ListTile(
              title: Text('Contacto'),
              onTap: () {
              Navigator.pushNamed(context, "contacto");              },  
            ),
            ListTile(
              title: Text('Politica'),
              onTap: () {
                
              },
            ),

            ListTile(
              title: Text('Versión'),
              onTap: () {
                
              },
              
            ),
          ],
        ),
      );
 }
}