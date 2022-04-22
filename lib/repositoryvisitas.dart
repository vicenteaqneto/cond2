
import 'dart:convert';

import 'package:cond2/visitas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RepositoryVisitas {
  String url = 'https://625ac5c6398f3bc782a60fa8.mockapi.io/visitas';
  

  Future getData()async {
try{
   final response = await http.get(Uri.parse(url));
   if (response.statusCode ==200){
     Iterable it = jsonDecode (response.body);
     List<Visitas> visitas = it.map((e) => Visitas.fromJson(e)).toList();
     return visitas;
   }else {
     throw Exception('Failha ao carregar dados');
   }
}catch (e){
  return e.toString();
}
  }

  
  Future createData (String nome, String data) async {
     try {
        final response = await http.post(Uri.parse(url),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  body: jsonEncode(<String,String> {
    'nome': nome,
    'data': data,
     }));
  if (response.statusCode == 201) {
    return Visitas.fromJson(jsonDecode(response.body));
  
  } else {
     throw Exception("Erro ao criar dados!");
  }
     } catch (e) {
       return e.toString();
     }
   }
  
  Future alterar( String id, String nome,  String data ) async{
 
      try {
        final response = await http.put(Uri.parse('$url/$id'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
   body: jsonEncode(<String, dynamic>{

    'nome': nome,
    'data': data,
         }), 
      );
    if (response.statusCode == 200) {
       
      return true;
    }
    else {
      return false;
  }
       } catch (e) {
        return e.toString();
      }
  }  

      
  Future deleteData(String id) async {
  try {
     final response = await http.delete(Uri.parse ('$url/$id'),
          headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
          );
       if (response.statusCode == 200) {
         return true;
     
       } else {
        return false;
       }
   } catch (e) {
    return e.toString();
  }
           } 
      }

     



