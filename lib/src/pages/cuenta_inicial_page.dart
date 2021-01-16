import 'package:app_construccion_agil/src/Models/Usuario_model.dart';
//import 'package:app_construccion_agil/src/pages/HomePage.dart';
import 'package:app_construccion_agil/src/Utils/Utils.dart' as utils;
import 'package:flutter/material.dart';
import "package:app_construccion_agil/src/Providers/Cuenta_provider.dart";


class CuentaInicialPage extends StatefulWidget {
  @override
  _CuentaInicialPageState createState() => _CuentaInicialPageState();

 
}

class _CuentaInicialPageState extends State<CuentaInicialPage> {

  final formkey2 = GlobalKey<FormState>();
  //final scaffoldKey2 = GlobalKey<ScaffoldState>();

  ModeloDeUsuario usuario = new ModeloDeUsuario();
  final cuentaProvider = new CuentaProvider();
  
  //bool _guardando = false;

  final colorAzul = Color.fromRGBO(4, 50, 60, 1);

  @override
  Widget build (BuildContext context) {
    ModeloDeUsuario usuarioData = ModalRoute.of(context).settings.arguments;
    if(usuarioData !=null){
      usuario = usuarioData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Cuenta"),
        backgroundColor: colorAzul ,
       ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.5),
            child: Form(
              key: formkey2,
              child: Column(
                children: [
                  _crearNombre(),
                  _crearEmail(),
                  _crearDireccion(),
                  _crearTelefono(),
                  _crearZona(),
                  _crearNoCuenta(),
                  _crearNoTarjeta(),
                  
                  
                  crearDisponible(),
                  _crearHorario(),
                  
                  
                  _crearBoton()
                ],
              ),
            ),
          )
        )
    
    );
  }

   Widget _crearNombre(){
    return TextFormField(
      //initialValue: usuario.nombreEmpresa,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Nombre Empresa"
      ),
      onSaved: (value)=> usuario.nombreEmpresa = value,
      validator: (value){
        if (value.length < 3){
          return "Ingrese el nombre de la empresa";
        } return null;
      },
    );
  }

   Widget _crearNoCuenta(){
     return TextFormField(
       keyboardType: TextInputType.numberWithOptions(decimal: false),
      //initialValue: usuario.zona.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Numero de Cuenta"
      ),
      onSaved: (value)=> usuario.noCuenta =int.parse (value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
          }
    );
   }

   Widget _crearNoTarjeta(){
     return TextFormField(
       keyboardType: TextInputType.numberWithOptions(decimal: false),
      //initialValue: usuario.zona.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Numero de Tarjeta"
      ),
      onSaved: (value)=> usuario.noTarjeta =int.parse (value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
          }
    );
   }

   Widget _crearTelefono(){
     return TextFormField(
       keyboardType: TextInputType.phone,
      //initialValue: usuario.telefono.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Telefono"
      ),
      onSaved: (value)=> usuario.telefono =int.parse (value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
          }
    );
   }

   Widget _crearZona(){
     return TextFormField(
       keyboardType: TextInputType.number,
      //initialValue: usuario.zona.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Codigo Postal"
      ),
      onSaved: (value)=> usuario.zona =int.parse (value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
          }
    );
      }

   Widget crearDisponible(){
     return Container();
   }

   Widget _crearHorario(){
     return Container();
   }

   Widget _crearEmail(){
     return TextFormField(
       keyboardType: TextInputType.emailAddress,
      initialValue: usuario.email,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Correo Empresa"
      ),
      onSaved: (value)=> usuario.email = value,
      validator: (value){
        if (value.length < 3){
          return "Ingrese Email";
        } return null;
      },
    );
   }

   Widget _crearDireccion(){
     return TextFormField(
      initialValue: usuario.direccion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Dirección de la Empresa"
      ),
      onSaved: (value)=> usuario.direccion = value,
      validator: (value){
        if (value.length < 10){
          return "Ingrese dirección de la empresa";
        } return null;
      },
    );
   }

   Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        icon: Icon (Icons.save),
        color: Colors.white70 ,
        label: Text("Confirmar",),
        textColor: Color.fromRGBO(4, 50, 60, 1),
         onPressed: _submit,
    );
  }

  
  void _submit(){

   if (!formkey2.currentState.validate())return;
    formkey2.currentState.save();

   
     print ("ok");
     print(usuario.nombreEmpresa);

     cuentaProvider.crearCuenta(usuario);


     Navigator.pushNamed(context, "registro");
  }


}