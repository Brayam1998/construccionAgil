// logica del componente



import 'dart:async';

import 'package:app_construccion_agil/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators { 
// vamos a tener dos controladores o stream controller
 final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
 // insertar valores al stream
 // no mandamos parametros porque no se esta ejecutando, se esta mandando como referencia para ejecutarse en otro lado
 // function(String) : una funcion que solo trabaja con Strings


 
Function(String) get changeEmail => _emailController.sink.add;
Function(String) get changePassword => _passwordController.sink.add;
 
//forma para escuchar el stream // Especificamos que es lo que fluye atraves del rio Stream<String>
Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

// Combinar Streams para validar el formulario
Stream<bool> get formValidStream => Rx.combineLatest2( emailStream, passwordStream, (e, p) => true);



// getter y setter para saber cuales son los ultimos valores del stream
  //ultimo valor ingresado
 String get email => _emailController.value;
 String get password => _passwordController.value;
//metodo para cerrarlocuadno ya o es nesesario 
 dispose(){
   _emailController?.close();
   _passwordController?.close();
 }
 // static LoginBloc of ( BuildContext context ){
  // return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;

} 