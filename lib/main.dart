

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; 

import "package:convert/convert.dart";

import 'Page/home.dart';


const req =  "https://api.hgbrasil.com/finance?format=json&key=2cebb1f2";

void main() async {
  
runApp(MaterialApp(
  home: Home(),
        theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )),
    debugShowCheckedModeBanner: false,));



}

Future <Map> getData()async{
  http.Response response = await http.get(req);
  return json.decode(response.body);
}
