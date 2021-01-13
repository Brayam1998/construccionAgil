import 'package:app_construccion_agil/src/Models/producto_model.dart';
import 'package:app_construccion_agil/src/Providers/productos_providers.dart';
import 'package:app_construccion_agil/src/pages/Productos_page.dart';
import 'package:flutter/material.dart';

import 'productos_Edit_page .dart';

class ListProductosPage extends StatefulWidget {


  @override
  _ListProductosPageState createState() => _ListProductosPageState();
}

class _ListProductosPageState extends State<ListProductosPage> {

  final productosProvider = new ProductosProvider();
  final colorAzul = Color.fromRGBO(4, 50, 60, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
       _crearListado(),
      
      
      floatingActionButton: _crearBoton(context,),
      
    );
  }


  Widget _crearListado(){
    return FutureBuilder(
      future: 
      productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ModeloDeProductos>> snapshot) {
        if (snapshot.hasData){
          final productos = snapshot.data;
          return Container(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              
              itemCount: productos.length,
              itemBuilder: (context, i)=> _crearItem(productos[i]),
         ),
          );
        }else{ 
          return Center(child: CircularProgressIndicator());
          
        }
      },
      );
  }



 Widget _crearItem( ModeloDeProductos producto){
   return Dismissible(
     key: UniqueKey(),
      background: Container(
        color: Colors.red
      ),
      onDismissed: (direccion){
        // metodo para bprar datos
        productosProvider.borrarProducto(producto.id);
      },
        child: ListTile(

       trailing: Icon(Icons.mode_edit, color: colorAzul,),
       title: Text('Producto: ${producto.nombre} - Cantidad : ${producto.cantidad}' ,style: TextStyle(backgroundColor: Colors.orange[50])),
                // la tercera linea esta al fondo a la derecha
       subtitle: Text("Precio Provedor : ${producto.precioProvedor}                                                                                                                                             Precio Maximo De Compra : ${producto.precioMaximo}", style: TextStyle (color: Colors.orange[700],), 
       ),
       
                 
                  
       onTap: () {
         
                Navigator.push(context,  
                MaterialPageRoute( builder: (context) => ProductosEditPage(), settings: RouteSettings  (arguments: producto),
              
                ), 
                );
              }
     ),
        );
 }


  Widget _crearBoton( BuildContext context ) {
    return FloatingActionButton(child: Icon(Icons.add),
    backgroundColor: Color.fromRGBO(4, 50, 60, 1),
    
      onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => ProductosPage()
            ),
            );
          },
     );
      //Navigator.pushNamed(context, "homepage");
  }
}