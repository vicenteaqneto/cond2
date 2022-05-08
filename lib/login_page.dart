import 'dart:convert';
import 'package:cond2/login_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cond2/cadastro.dart';
import 'package:cond2/create_page.dart';
import 'package:cond2/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  final controladorEmail = TextEditingController();
  final controladorSenha = TextEditingController();

  final _FormKey = GlobalKey<FormState>();

  bool _mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _FormKey,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text("Bem vindo ao ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    SizedBox(height: 30),
                    Text("CONDOMINIUM",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    SizedBox(height: 80),
                    TextFormField(
                        controller: controladorEmail,
                        
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null) {
                            return "Por favor, digite seu e-mail";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(controladorEmail.text)) {
                            return 'Por favor, digite um e-mail válido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: "E-mail",
                          hintText: "Digite seu E-mail",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email),
                        )),
                    SizedBox(height: 20),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controladorSenha,
                       
                        obscureText:_mostrarSenha == false? true : false,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return "Por favor, digite sua senha";
                          } else if (senha.length < 6) {
                            return 'Por favor, digite uma senha maior que 6 caracteres';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                           child: Icon(_mostrarSenha == false? Icons.visibility_off : Icons.visibility),
                           onTap: (){
                             setState(() {
                               _mostrarSenha = !_mostrarSenha;
                             });
                           },
                          )
                        
                        ),
                        ),
                    SizedBox(height: 10),
                    Builder(builder: (context) {
                      return RaisedButton(
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (_FormKey.currentState!.validate()) {
                            bool deuCerto = await login();
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (deuCerto) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()));
                            } else {
                              controladorSenha.clear();
                              ScaffoldMessenger.of(context)
                                ..showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text("Entrar"),
                      );
                    }),
                    SizedBox(height: 30),
                    Text("Ou"),
                    SizedBox(height: 20),
                    RaisedButton(
                        onPressed: () async {
                         Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginRegister()));
                        },
                        child: Text("Cadastre-se")),
                  ],
                ),
              ),
            ),
          ),
        ),
       
      ),
    );
  }

  

  final snackBar = SnackBar(
      content: Text(
        "E-mail ou senha incorretos", 
        textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent);

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse("https://reqres.in/api/login");
    var resposta = await http.post(url, body: {
      'email': controladorEmail.text,
      'password': controladorSenha.text,
    });
    if (resposta.statusCode == 200) {
      await sharedPreferences.setString(
          'token', ' Token ${jsonDecode(resposta.body)["token"]}');
      //print("Token: " + jsonDecode(resposta.body)["token"]);
      return true;
    } else {
      //print(jsonDecode(resposta.body));
      return false;
    }
  }
}
