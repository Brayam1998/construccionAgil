import 'dart:convert';

//import 'package:app_construccion_agil/src/Models/Usuario_model.dart';
import 'package:app_construccion_agil/src/preferenciasUsuario/preferencias_usuario.dart';
import "package:http/http.dart" as http;

class UsuarioProvider {
  //final String _url = "https://construccionagil-4c8f1-default-rtdb.firebaseio.com";
  

 final String _firebaseToken =  "AIzaSyAjKHFiX9uqj29_4OfZCagj9DBNKPju4uk" ;

 final _prefs = new PreferenciasUsuario();

 Future<Map<String,dynamic>> login( String email , String password) async {

   
   final authData = {
    "email" : email,
    "password" : password,
    "returnSecureToken" : true
  };

final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );

   Map<String, dynamic> decodedResp = json.decode(resp.body);
   print(decodedResp);



   if (decodedResp.containsKey("idToken")){
     // salvar el token en el storage
     _prefs.token = decodedResp["idToken"];
   
     return{
       "ok" : true, "token" : decodedResp["idToken"]
     };
   }else {
     return{ "ok" : false, "mensaje" : decodedResp["error"]["menssage"]};
   } 


 }

 //-------------------------------------------------------------------------------------------------------------------------------
  // creamos el metodo nuevo usuario
  Future<Map<String,dynamic>>nuevoUsuario( String email , String password) async {
  //para madar la informacion a firebase es con un post a un body codificado
 
  final authData = {
    "email" : email,
    "password" : password,
    "returnSecureToken" : true
  };
   final resp = await http.post("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken",body : json.encode(authData));

   Map<String, dynamic> decodedResp = json.decode(resp.body);
   print(decodedResp);

   if (decodedResp.containsKey("idToken")){
     // salvar el token en el storage
     _prefs.token = decodedResp["idToken"];
   
     return{
       "ok" : true, "token" : decodedResp["idToken"]
     };
   }else {
     return{ "ok" : false, "mensaje" : decodedResp["error"]["menssage"]};
   }

  }


}