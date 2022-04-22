import 'package:cond2/cadastro.dart';
import 'package:cond2/create_page.dart';
import 'package:cond2/create_visitas.dart';
import 'package:cond2/login.dart';
import 'package:cond2/pagevisitas.dart';

import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:cond2/update_page.dart';
import 'package:cond2/update_visitas.dart';
import 'package:cond2/zap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
         debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'cadastro': (context) =>Cadastro(),
         'create': (context) => CreatePage(),
         'update' : (context)=> UpdatePage(),
         'wathsapp':(context) => Zap(),
         'visitas': (context)=> PageVisitas(),
         'createvisitas':(context)=> CreateVisitas(),
         'updatevisitas':(context)=> UpdateVisitas(),
      }
    );
  }
}
