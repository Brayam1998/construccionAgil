import 'package:flutter/material.dart';

class OrdenesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[_cardTipo1(),
        SizedBox (height : 30.0),
        _cardTipo2(),
        SizedBox (height : 30.0),_cardTipo1(),
        SizedBox (height : 30.0),
        _cardTipo2(),
        SizedBox (height : 30.0),_cardTipo1(),
        SizedBox (height : 30.0),
        _cardTipo2(),
        SizedBox (height : 30.0),_cardTipo1(),
        SizedBox (height : 30.0),
        _cardTipo2(),
        SizedBox (height : 30.0),_cardTipo1(),
        SizedBox (height : 30.0),
        _cardTipo2(),
        SizedBox (height : 30.0),
        ],
      ),
        
    );
  }

  Widget _cardTipo1(){
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius : BorderRadius.circular(30.0)),
      child: Column(children: <Widget> [
     ListTile(
       leading: Icon(Icons.image , color: Colors.blue),
       title: Text("Soy el titulo de esta APP"),
       subtitle: Text("somos la base de la consucta de las cosas qie se pueden y no se pueden hacer por las coas que las cosas que se seeee"),
     ),
     Row(mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget> [
       FlatButton(onPressed: (){},
        child: Text ("Cancelar")
        ),
        FlatButton(onPressed: (){},
        child: Text ("Ok")
        )
     ],
     )   
      ],
      ),
    );
  }
 Widget _cardTipo2(){
   final card =  Container(child: Column(
     children: <Widget>[
     FadeInImage(
       height: 300.0,
       fit: BoxFit.cover,
       fadeInDuration: Duration(milliseconds : 200),
       placeholder: AssetImage("assets/jar-loading.gif") , 
       image: NetworkImage("https://ngnoticias.com/wp-content/uploads/2016/12/ce.jpg"),
     ),
     Container(
       padding: EdgeInsets.all(10.0),
       child: Text("Aqui esta las muchachonas" ,style: TextStyle(color: Colors.white) ,))
        ],
   ),
   );

   return Container(
     child: ClipRRect(
       borderRadius: BorderRadius.circular(30.0),
       child: card,
     ),
     decoration: BoxDecoration(
       color: Colors.black87,
       borderRadius: BorderRadius.circular(20.0),
       boxShadow: <BoxShadow>[
         BoxShadow(
           color: Colors.black26,
           blurRadius: 3.0,
           offset: Offset(1.1, 0.1),
           spreadRadius: 7.3
         )
       ]
       //color: Colors.red
       ),
     
   );
 }
}