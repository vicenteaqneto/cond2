

import 'package:cond2/cadastro.dart';
import 'package:cond2/create_page.dart';
import 'package:cond2/menu.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
String email = ' ';
String password= ' ';

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox( height: 30),
                Text("Bem vindo ao ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
                SizedBox( height: 30),
                Text("CONDOMINIUM", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
                SizedBox( height: 80),
                TextField(
                  onChanged: (text){
                      email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder() 
                )
                ),
                SizedBox(height: 20),
                 TextField(
                    onChanged: (text){
                      password = text;
                  },
                   obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder() 
                )
                ),
                SizedBox(height: 10),
               RaisedButton(onPressed: 
             () async {
              
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Menu(), 
                        ),
                      );
                    },
        
      
                 child: Text("Entrar"),
               ),
               SizedBox(height: 30),
                Text("Ou"),

                SizedBox(height: 20),
               RaisedButton(onPressed:  () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CreatePage(), 
                        ),
                      );
                    },
                         child: Text("Cadastre-se")
             
               ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}