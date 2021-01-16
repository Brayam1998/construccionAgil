// es el encargado de hacer las interacciones directas con la base de datos
import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:app_construccion_agil/src/Models/producto_model.dart';
import "package:app_construccion_agil/src/preferenciasUsuario/preferencias_usuario.dart";



class ProductosProvider{

 final String _url = "https://construccion-agil-default-rtdb.firebaseio.com";
 final String _construccionAgilnodo = "https://construccionagil-4c8f1-default-rtdb.firebaseio.com/Provedores/-MQjx4zHhliMJWoWhOKL";
 final _prefs = new PreferenciasUsuario();

 Future<bool> crearProducto(ModeloDeProductos producto) async{


   //final url = "$_url/productos.json?auth=${_prefs.token}";
   final url = "$_construccionAgilnodo/productos.json";
   final resp = await http.post(url, body: modeloDeProductosToJson(producto));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }
 
  Future<bool> editarProducto(ModeloDeProductos producto) async{

   final url = "$_url/productos/${producto.id}.json?auth=${_prefs.token}";
   
   final resp = await http.put(url, body: modeloDeProductosToJson(producto));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }

  //LISTA PARA RENDERIZAR LOS PRODUCTOS DE LA BASE DEDATOS EN LA PAGINA DE LISTADO DE PRODUCTOS.
 Future <List<ModeloDeProductos>> cargarProductos()async{
 // almacenamosla direccion en donde tenemos los datos en tipo json
 //final url = "$_url/productos.json?auth=${_prefs.token}";
 final url = "$_construccionAgilnodo/productos.json";
 // vamos a realizar la peticion get
 final resp = await http.get(url) ;
 final  Map<String,dynamic> decodedData = json.decode(resp.body);
 final List<ModeloDeProductos> productos = new List();

 if (decodedData == null) return [];
 
 decodedData.forEach( (id , prod){
  

   final prodTemp = ModeloDeProductos.fromJson(prod);
   prodTemp.id = id;
   productos.add(prodTemp);
 });
 return productos;

 }
   

   // metodo para borrar productos:
   Future<int> borrarProducto(String id) async{
     final url = "$_url/productos/$id.json?auth=${_prefs.token}";
     final resp = await http.delete(url);
     print(resp.body);
     return 1;
   }
}