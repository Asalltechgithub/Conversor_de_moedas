
import 'package:flutter/material.dart';


import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

final realcontoller = TextEditingController();
final dollarcontoller = TextEditingController();
final eurocontoller = TextEditingController();

double dollar;
double euro;

void _realChange(String text){
double real = double.parse(text);
dollarcontoller.text = (real/dollar).toStringAsFixed(2);
eurocontoller.text = (real/euro).toStringAsFixed(2);

}
void _dolarChange(String text){
double dolar =double.parse(text);
realcontoller.text =( dolar * this.dollar).toStringAsFixed(2);
eurocontoller.text =(dolar *this.dollar/euro).toStringAsFixed(2);
  
}
void _euroChange(String text){
double euro = double.parse(text);
realcontoller.text =(euro*this.euro).toStringAsFixed(2);
dollarcontoller.text =(euro* this.euro).toStringAsFixed(2);
  
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor de moedas \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        
    actions: <Widget>[],
    ),
    
    body: FutureBuilder<Map>(
      future: getData(),
      builder: (context,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          
          case ConnectionState.waiting:
          return Center(
            child: Text("Carregando dados",style: TextStyle(
              color: Colors.amber,
              fontSize:25.0 ,
              
            ),textAlign: TextAlign.center,),
            
            );
          default:
          if(snapshot.hasError){
              return Center(
            child: Text("erro Carregando dados :(",style: TextStyle(
              color: Colors.amber,
              fontSize:25.0 ,
              
            ),textAlign: TextAlign.center,),
            
            );
            }
            else {
              dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
              euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

              return SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                  Icon(
                    Icons.monetization_on,size: 150.0,
                    color: Colors.amber,)
                          ,
                  buildTexField("Real", "R\$",realcontoller, _realChange),
                
                  Divider(),
                 buildTexField("Dolar", "\$",dollarcontoller,_dolarChange),
                  
                  Divider(),
                  buildTexField("Euro", "€" ,eurocontoller,_euroChange)
                ],) ,);
            }
          
            
        }
      },)
    
    
    
    );
      
      
      
  }
}
Widget buildTexField(String label ,String prefix,TextEditingController c,Function f){
return TextField(
                    controller: c,
                    decoration:InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(color: Colors.amber),
                    border:OutlineInputBorder(),
                    prefixText: prefix,
                    
                  ),
                  onChanged: f,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.amber,fontSize: 25.0) ,
                  );
}