
import 'package:app_construccion_agil/src/bloc/provider.dart';
import 'package:app_construccion_agil/src/pages/HomePage.dart';
import 'package:flutter/material.dart';
import "package:app_construccion_agil/src/Providers/usuario_provider.dart";
import "package:app_construccion_agil/src/Utils/Utils.dart";
import 'package:app_construccion_agil/src/Models/Usuario_model.dart';

class RegistroPage extends StatelessWidget {
  final usuario = new ModeloDeUsuario();
  final usuarioProvider = new UsuarioProvider();
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final colorAzul = Color.fromRGBO(4, 50, 60, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body : Stack(
        key: formkey,
        children :<Widget>[
          _crearFondo(context),
          _loginForm(context, LoginBloc),
        ]
      )
    );
  }


 Widget _crearFondo(BuildContext context){


   final size = MediaQuery.of(context).size;
   
   
   final fondoMorado = Container(
   height: size.height * 1.0,
   width: double.infinity,
   decoration: BoxDecoration ( color: Colors.orange

   ) ,
   );   

    final circulo = Container (
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color : Color.fromRGBO(255, 255, 255, 0.2)
      ),
    );

      return Stack( children: <Widget>[
     fondoMorado,
     Positioned(child: circulo, top: 90.0, left: 20.0),
     Positioned(child: circulo, top: -70.0, left: -9.0),
     Positioned(child: circulo, top: -20.0, right: -30.0),
     Positioned(child: circulo, top: 220.0, right: 5.0), // 
     
       Container(
       padding: EdgeInsets.only(top : 80.0),
        child: Column(
       children: <Widget> [
          Icon(Icons.business ,  color: colorAzul, size: 100,),
          SizedBox(height: 10 , width: double.infinity,),
          Text("Construcción Ágil", style: TextStyle(color : Colors.white, fontSize: 20)
          ),
          Text("Correo y Contraseña", style: TextStyle(color : Colors.white, fontSize: 20)),

          ]
     )
     )
   ],

   );
  
  
  }

 Widget _loginForm(BuildContext context, bloc){  
   // para buscar instancias del bloc en este arbolde widgets y tener acceso a las propiedades del bloc
  final bloc = Provider.of(context);
  final size = MediaQuery.of(context).size;

   return SingleChildScrollView(
     child: Column(children: <Widget>[
       SafeArea(child: Container(height: 210.0,)),
       Container(
         width: size.width * .85,
         padding: EdgeInsets.symmetric(vertical : 30),
         margin: EdgeInsets.symmetric(vertical : 30),
         decoration: BoxDecoration(
           color: Colors.white,
           boxShadow: <BoxShadow>[
             BoxShadow(
               color : Colors.black45,
               blurRadius: 6.0,
               offset: Offset(0.0, 2.0),
               spreadRadius: 3.0

             )
           ],
           borderRadius: BorderRadius.circular(7.0)
         ),
         child: Column(children: <Widget>[
           Text("Confirmar Datos" , style: TextStyle(fontSize:20 ),),
           SizedBox(height: 40.0,), 

         _crearEmail( bloc ),
         SizedBox(height: 10.0,),
         _crearPassword( bloc ),
         SizedBox(height: 40.0,),
         _crearBoton( bloc ),

         ],
         ),
       ),
        FlatButton(onPressed: ()=> Navigator.pushReplacementNamed(context, "login") ,
         child: Text("Volver a Login"))
     ],
         
     ),
   );
 }

 Widget _crearEmail(LoginBloc bloc){
  
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      
      return Container(
     padding: EdgeInsets.symmetric(horizontal : 20.0) ,
     child: TextFormField(
       initialValue: usuario.email,
       keyboardType: TextInputType.emailAddress,
       decoration: InputDecoration(
         icon: Icon(Icons.alternate_email , color : colorAzul),
         hintText: "ejemplo@correo.com",
         labelText: "Confirmar Correo",
         //counterText: snapshot.data,
         errorText: snapshot.error
       ),
       onChanged: bloc.changeEmail,
       onSaved: (value) => usuario.email = value,
     ),
   ); 
    },
  );
  
   
 }

 Widget _crearPassword( LoginBloc bloc ){
   return StreamBuilder(
     stream: bloc.passwordStream,
     builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
     padding: EdgeInsets.symmetric(horizontal : 20.0) ,
     child: TextField(
       keyboardType: TextInputType.emailAddress,
       obscureText: true,

       decoration: InputDecoration(
         icon: Icon(Icons.lock_outline , color : colorAzul),
         labelText: " Crear Contraseña",
         //counterText: snapshot.data,
         errorText: snapshot.error
       ),
       onChanged: (value) => bloc.changePassword(value)
     ),
   );     
     },
   );
   
 }

  Widget _crearBoton(LoginBloc bloc){
    return
    StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
    child: Container(
      
      padding: EdgeInsets.symmetric(horizontal: 95 , vertical: 15),
      child: Text("Registrar" , style: TextStyle(fontSize: 15),)
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)) ,
    color: colorAzul,
    textColor: Colors.white,
    onPressed: snapshot.hasData ? () =>_register(bloc,context) : null
    // texto como debe quedar :  onPressed: snapshot.hasData ? () => _login   : null
    );
      },
    );
    
    }

     _register (LoginBloc bloc, BuildContext context, ) async { 
     Map info = await  usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
     if (info["ok"]){
       
      
       Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
     }else{
       mostarAlerta(context, "información Incorrecta");
     }
     }
    
}          