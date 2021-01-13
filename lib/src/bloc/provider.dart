import 'package:flutter/material.dart';
import 'package:app_construccion_agil/src/bloc/login_bloc.dart';
export 'package:app_construccion_agil/src/bloc/login_bloc.dart';


 class Provider extends InheritedWidget{
   final loginBloc = LoginBloc();
 

    static Provider _instancia;

    factory Provider( {Key key, Widget child}){
      if (_instancia == null){
        _instancia = new Provider._internal(key: key , child: child,);
      } return _instancia;
    }

   //contructor:
   Provider._internal({Key key, Widget child})
   : super(key : key, child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>true;
  //cuando usemos esta informacion del InheritedWidget 
  //vamos a ocupar la instancia del login bloc y qe nos regrese el estado del login bloc
  // para decir que este es metodoq ue se llame directamente  of es nombre y of recive un metodo busca y retorna 
   static LoginBloc of ( BuildContext context ){
  return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }



 }