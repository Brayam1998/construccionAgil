

  //LISTA PARA RENDERIZAR LOS PRODUCTOS DE LA BASE DEDATOS EN LA PAGINA DE LISTADO DE PRODUCTOS.
import 'package:app_construccion_agil/src/Models/ordenes_model.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

class OrdenesProvider{
    final String _construccionAgilnodo = "https://construccionagil-4c8f1-default-rtdb.firebaseio.com/Provedores/-MQjx4zHhliMJWoWhOKL";



   Future <List<ModeloOrdenes>> cargarOrdenes()async{
    // almacenamosla direccion en donde tenemos los datos en tipo json
   final url = "$_construccionAgilnodo/ordenes.json";
   // vamos a realizar la peticion get
   final resp = await http.get(url);
   final  Map<String,dynamic> decodedData = json.decode(resp.body);
   final List<ModeloOrdenes> ordenes = new List();

   if (decodedData == null) return [];
 
   decodedData.forEach( (id , orden){
  

   final ordenTemp = ModeloOrdenes.fromJson(orden);
   ordenTemp.id = id;
   ordenes.add(ordenTemp);
   });
   return ordenes;
 }

 Future<bool> crearOrden(ModeloOrdenes orden) async{


   //final url = "$_url/productos.json?auth=${_prefs.token}";

   //TODO crear el nodo ordenes 
   final url = "$_construccionAgilnodo/ordenes.json";
   final resp = await http.post(url, body: ordenesToJson(orden));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }



  Future<bool> editarOrden(ModeloOrdenes orden) async{

  final url = "$_construccionAgilnodo/ordenes.json";
   
   final resp = await http.put(url, body: ordenesToJson(orden));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }
 


}