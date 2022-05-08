import 'dart:convert';
import 'package:cond2/boasvindas_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cond2/cadastro.dart';
import 'package:cond2/create_page.dart';
import 'package:cond2/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final controladorEmail = TextEditingController();
  final controladorSenha = TextEditingController();
  final controladorSenha2 = TextEditingController();

  final _FormKey = GlobalKey<FormState>();

late String email, senha, senha2;

bool _mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Cadastro de Acesso", 
      style:TextStyle(fontSize: 20,
       fontWeight: FontWeight.bold,)),
      
       ),
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
                         onSaved: (value) =>  email = value!,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Digite seu E-mail",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email),
                        )),
                    SizedBox(height: 20),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controladorSenha,
                        obscureText: _mostrarSenha == false? true : false,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return "Por favor, digite sua senha";
                          } else if (senha.length < 6) {
                            return 'Por favor, digite uma senha maior que 6 caracteres';
                          }
                          return null;
                        },
                        onSaved: (value) => senha = value!,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          border: OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                           child: Icon(_mostrarSenha == false? Icons.visibility_off : Icons.visibility),
                           onTap: (){
                             setState(() {
                               _mostrarSenha = !_mostrarSenha;
                             });
                           },
                          ),
                        )
                        ),
                    SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controladorSenha2,
                        obscureText: _mostrarSenha == false? true : false,
                        validator: (senha2) {
                          if (senha2 == null || senha2.isEmpty) {
                            return "Por favor, digite sua senha";
                          } else if (senha2 != controladorSenha.text) {
                            return 'Senhas divergentes, favor repetir a senha cadastrada anteriormente.';
                          }
                          return null;
                        },
                        
                        onSaved: (value) => senha2 = value!,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          hintText: "Repita sua senha",
                          border: OutlineInputBorder(),
                          suffixIcon:GestureDetector(
                           child: Icon(_mostrarSenha == false? Icons.visibility_off : Icons.visibility),
                           onTap: (){
                             setState(() {
                               _mostrarSenha = !_mostrarSenha;
                             });
                           },
                          ),
                        )
                        ),
                        SizedBox(height: 15,),
                    Builder(builder: (context) {
                      return RaisedButton(
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (_FormKey.currentState!.validate()) {
                            login2();
                              ScaffoldMessenger.of(context)
                                ..showSnackBar(snackBar);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BoasVindasPage()));
                            
                          }
                        },
                        child: Text("Cadastrar"),
                        
                      );
                      
                    },
                    
                    ),
                    SizedBox(height: 40),
                    Text("Ou"),
                    SizedBox(height: 60),
                    RaisedButton(onPressed: (){
                      Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BoasVindasPage()));
                    },
                    child: Text("Retornar"),
                    )
                   ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> login2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://625ac5c6398f3bc782a60fa8.mockapi.io/login');
    var response = await http.post(url, body: {
      'email': controladorEmail.text,
      'senha': controladorSenha.text,
      'senha2':controladorSenha2.text,
    });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['token']);
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }

  final snackBar = SnackBar(
      content: Text(
        "Cadastro efetuado com sucesso!",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent);


}
