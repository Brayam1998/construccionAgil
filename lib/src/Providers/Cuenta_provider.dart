import 'dart:convert';

import "package:http/http.dart" as http;
import "package:app_construccion_agil/src/Models/Usuario_model.dart";
//import "package:app_construccion_agil/src/preferenciasUsuario/preferencias_usuario.dart";



class CuentaProvider{

 final String _url = "https://construccionagil-4c8f1-default-rtdb.firebaseio.com";
 //final _prefs = new PreferenciasUsuario();

 Future<bool> crearCuenta(ModeloDeUsuario usuario) async{


   final url = "$_url/Provedores.json";
   
   final resp = await http.post(url, body: modeloDeUsuariotoJson(usuario));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }
 

   //LISTA PARA RENDERIZAR LOS PRODUCTOS DE LA BASE DEDATOS EN LA PAGINA DE LISTADO DE PRODUCTOS.
 Future <List<ModeloDeUsuario>> cargarUsuario()async{
 // almacenamosla direccion en donde tenemos los datos en tipo json
 final url = "$_url/Provedores.json";
 // vamos a realizar la peticion get
 final resp = await http.get(url);
 final  Map<String,dynamic> decodedData = json.decode(resp.body);
 final List<ModeloDeUsuario> usuarios = new List();

 if (decodedData == null) return [];
 
 decodedData.forEach( (id , user){
  

   final userTemp = ModeloDeUsuario.fromJson(user);
   userTemp.id = id;
   usuarios.add(userTemp);
 });
 return usuarios;
  }

   /* Future<bool> editarProducto(ModeloDeProductos producto) async{

   final url = "$_url/productos/${producto.id}.json?auth=${_prefs.token}";
   
   final resp = await http.put(url, body: modeloDeProductosToJson(producto));

   final decodedData = json.decode(resp.body);
   
   print(decodedData);
   return true;
  }

   /* 

 }*/
   

   // metodo para borrar productos:
   Future<int> borrarProducto(String id) async{
     final url = "$_url/productos/$id.json?auth=${_prefs.token}";
     final resp = await http.delete(url);
     print(resp.body);
     return 1;
   } */
}