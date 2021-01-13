
import 'package:app_construccion_agil/src/Models/producto_model.dart';
import 'package:app_construccion_agil/src/Providers/productos_providers.dart';
import 'package:app_construccion_agil/src/Utils/Utils.dart' as utils;
import 'package:flutter/material.dart';

import 'HomePage.dart';

class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();

 
}

class _ProductosPageState extends State<ProductosPage> {

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ModeloDeProductos producto = new ModeloDeProductos();
  final productoProvider = new ProductosProvider();
  double precioinicial = 0;
  bool _guardando = false;

  final colorAzul = Color.fromRGBO(4, 50, 60, 1);

  @override
  Widget build(BuildContext context) {
    ModeloDeProductos prodData = ModalRoute.of(context).settings.arguments;
    if(prodData !=null){
      producto = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Agregar Producto"),
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
                 _crearPrecioProvedor(),
                 _mostrarCantidad(),
                 _crearDisponible(),
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
      initialValue: producto.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         labelText: "Nombre"
      ),
      onSaved: (value)=> producto.nombre = value,
      validator: (value){
        if (value.length < 3){
          return "Ingrese el nombre del producto";
        } return null;
      },
    );
  }
  Widget _mostrarCantidad(){
    return TextFormField(
      initialValue: producto.cantidad.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal : false),
      decoration: InputDecoration(
         labelText: "Cantidad Disponible"
      ),
      onSaved: (value) => producto.cantidad = int.parse(value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "solo numeros";
          }
      },
    );
  }
  Widget _crearPrecioProvedor(){
    return TextFormField(
      initialValue: producto.precioProvedor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal : true),
      decoration: InputDecoration(
         labelText: "Precio Provedor"
      ),
      onSaved: (value) => producto.precioProvedor = double.parse(value),
      validator: (value){
        if (utils.isNumeric(value) ){
          return null; // pasa la validación sin problemas por eso no regresa nada
          }else{
            return "Solo Numeros";
          }
      },
    );
  }

  Widget _crearDisponible(){
    return SwitchListTile(
      activeColor: Colors.orange,
      value: producto.disponible,
      title: Text("Disponible"),
      onChanged:(value) => setState(() {
        producto.disponible = value;
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
    
  if (producto.id == null){ productoProvider.crearProducto(producto);

  }else{productoProvider.editarProducto(producto);}


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