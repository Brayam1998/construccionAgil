import 'package:app_construccion_agil/src/Models/ordenes_model.dart';
import 'package:app_construccion_agil/src/Providers/Ordenes_provider.dart';
import 'package:flutter/material.dart';

class DatosPage extends StatefulWidget {


  @override
  _DatosPageState createState() => _DatosPageState();
}

class _DatosPageState extends State<DatosPage> {

  final ordenesProvider = new OrdenesProvider();
  final colorAzul = Color.fromRGBO(4, 50, 60, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
       _crearListado(),
      
      
      //floatingActionButton: _crearBoton(context,),
      
    );
  }


  Widget _crearListado(){
    return FutureBuilder(
      future: 
      ordenesProvider.cargarOrdenes(),
      builder: (BuildContext context, AsyncSnapshot<List<ModeloOrdenes>> snapshot) {
        if (snapshot.hasData){
          final ordenes = snapshot.data;
          return Container(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              
              itemCount: ordenes.length,
              itemBuilder: (context, i)=> _crearItem(ordenes[i]),
         ),
          );
        }else{ 
          return Center(child: CircularProgressIndicator());
          
        }
      },
      );
  }



 Widget _crearItem( ModeloOrdenes ordenes){
   return Container(
        color: Colors.red,
        child: ListTile(

       trailing: Icon(Icons.mode_edit, color: colorAzul,),
       title: Text('Producto: ${ordenes.producto} - Cantidad : ${ordenes.cantidad}' ,style: TextStyle(backgroundColor: Colors.orange[50])),
                // la tercera linea esta al fondo a la derecha
       subtitle: Text("Precio Total : ${ordenes.precioTotal}                                                                                                                                             Precio Maximo De Compra : ${ordenes.precioTotal}", style: TextStyle (color: Colors.orange[700],), 
       ),
       )
       );
      }
       
                 
                  
       /*onTap: () {
         
                Navigator.push(context,  
                MaterialPageRoute( builder: (context) => ProductosEditPage(), settings: RouteSettings  (arguments: ordenes),
              
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
  }*/
}