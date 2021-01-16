
import 'package:app_construccion_agil/src/Providers/Ordenes_provider.dart';
import 'package:flutter/material.dart';

class DatosPage extends StatelessWidget {
  final ordenesProvider = new OrdenesProvider();
  final colorAzul = Color.fromRGBO(4, 50, 60, 1);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: 
      Center(child: Text("Datos Page"),)
    
    );   
  }
}