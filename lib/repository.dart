
import 'dart:convert';
import 'package:cond2/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repository {
  String url = 'https://625ac5c6398f3bc782a60fa8.mockapi.io/contatos';
  

  Future getData()async {
try{
   final response = await http.get(Uri.parse(url));
   if (response.statusCode ==200){
     Iterable it = jsonDecode (response.body);
     List<Person> person = it.map((e) => Person.fromJson(e)).toList();
     return person;
   }else {
     throw Exception('Failed to load data');
   }
}catch (e){
  return e.toString();
}
  }

  
  Future createData (String nome, String apartamento, String email,  String telefone, String senha) async {
     try {
        final response = await http.post(Uri.parse(url),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  body: jsonEncode(<String,String> {
    'nome': nome,
    'apartamento': apartamento,
     'email': email,
    'telefone': telefone,
    'senha': senha,
  }));
  if (response.statusCode == 201) {
    return Person.fromJson(jsonDecode(response.body));
  
  } else {
     throw Exception("Erro ao criar dados!");
  }
     } catch (e) {
       return e.toString();
     }
   }
  
  Future alterar( String id, String nome,  String apartamento,  String email,  String telefone, String senha, ) async{
 
      try {
        final response = await http.put(Uri.parse('$url/$id'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
   body: jsonEncode(<String, dynamic>{

    'nome': nome,
    'apartamento': apartamento,
     'email': email,
    'telefone': telefone,
    'senha': senha,
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

     



