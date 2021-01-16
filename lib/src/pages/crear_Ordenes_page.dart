import 'package:app_construccion_agil/src/Models/ordenes_model.dart';
import 'package:app_construccion_agil/src/Providers/Ordenes_provider.dart';
import 'package:app_construccion_agil/src/Utils/Utils.dart' as utils;
import 'package:flutter/material.dart';

import 'HomePage.dart';

class CrearOrdenesPage extends StatefulWidget {
  @override
  _CrearOrdenesPageState createState() => _CrearOrdenesPageState();

 
}
class _CrearOrdenesPageState extends State<CrearOrdenesPage> {

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ModeloOrdenes orden = new ModeloOrdenes();
  final ordenProvider = new OrdenesProvider();
  bool _guardando = false;

  final colorAzul = Color.fromRGBO(4, 50, 60, 1);

  @override
  Widget build(BuildContext context) {
    ModeloOrdenes ordenData = ModalRoute.of(context).settings.arguments;
    if(ordenData !=null){
      orden = ordenData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Agregar Orden"),
        backgroundColor: colorAzul ,
       ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.5),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  _crearNombre(),
                 _crearPrecioXunidad(),
                 _mostrarCantidad(),
                 //_crearEnvioEfectivo(),
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
      initialValue: orden.producto,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "producto"
      ),
      onSaved: (value)=> orden.producto = value,
      validator: (value){
        if (value.length < 3){
          return "Ingrese el nombre del producto";
        } return null;
      },
    );
  }
  Widget _mostrarCantidad(){
    return TextFormField(
      //initialValue: orden.cantidad.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal : false),
      decoration: InputDecoration(
         labelText: "Cantidad Disponible"
      ),
      onSaved: (value) => orden.cantidad = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
      },
    );
  }
  Widget _crearPrecioXunidad(){
    return TextFormField(
      //initialValue: orden.precioProvedor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal : true),
      decoration: InputDecoration(
         labelText: "Precio X unidad"
      ),
      onSaved: (value) => orden.precioXunidad = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "Solo Numeros";
          }
      },
    );
  }

  Widget _crearEnvioEfectivo(){
    return SwitchListTile(
      activeColor: Colors.orange,
      value: orden.envioEfectivo,
      title: Text("Disponible"),
      onChanged:(value) => setState(() {
        orden.envioEfectivo = value;
      })
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        
        
      ),
    onPressed: (_guardando ) ? null :_submit,
    elevation: 10,
    icon: Icon (Icons.save),
    color: Colors.white70 ,
    label: Text("Guardar y Enviar",),
    textColor: Color.fromRGBO(4, 50, 60, 1),
    );
  }

  
  void _submit(){
    // poder hacer referencia al formulario: creamos controlador tipo key en el Form y en la clase principal.
   //formkey.currentState.validate();
   // si formulario es valido regresa el true o false
  if (!formkey.currentState.validate())return;

  // instruccion para disparar el onsaved
  formkey.currentState.save();
  // salva todos los datos que estan en el formulario si es que la validacion se cumplio.
  _guardando = true;
  setState(() {});
    
  if (orden.id == null){ ordenProvider.crearOrden(orden);

  }else{ordenProvider.editarOrden(orden);}


  mostrarSnackbar("Registro Enviado");



  //Navigator.pop(context);

  Navigator.push(context, 
  MaterialPageRoute(builder: (context) => HomePage()
  ),
  );
  }

  // mostrar el string del snackbar que utilizare para poder reutilizar el snackbar
 void mostrarSnackbar( String mensaje){
 final snackBar =  SnackBar(content: Text(mensaje),duration: Duration (milliseconds: 3500)
 ); 
 scaffoldKey.currentState.showSnackBar(snackBar);

 } // para mostrar el snack deberi utlizar la referencia al scaffold con un scaffold key 
 
  
}