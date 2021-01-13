// funcion si es numero o no  regresa un valor boleano 
import 'package:flutter/material.dart';

bool isNumeric(String valorIngresadoXusuario){
  if (valorIngresadoXusuario.isEmpty)return false;
  final n = num.tryParse(valorIngresadoXusuario); 
  // el valor parceado a un numero se almacenara en la variable n
  return (n == null) ? false : true; // si el valor no se puede parcear a un numero regrasara un false, caso contrario regresa un true.
}

 mostarAlerta(BuildContext context, String mensaje){
  showDialog(context: context,

  builder: (context){
    return AlertDialog(
   title: Text("Información Incorrecta"),
   content: Text(mensaje),
   actions:
     <Widget>[ FlatButton(onPressed:() =>Navigator.of(context).pop(),
       child : Text("OK"),
     
     )
   ],
    );
  }
  
   );
}