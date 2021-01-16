import 'package:flutter/material.dart';
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_shipping)), 
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
            ],
          ),
        ),
      ),
    );
  }
 
}