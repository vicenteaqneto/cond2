
import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({ Key? key }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {


final TextEditingController controladorNome = TextEditingController();
final TextEditingController controladorApartamento = TextEditingController();
final TextEditingController controladorEmail = TextEditingController();
final TextEditingController controladorTelefone = TextEditingController();
final TextEditingController controladorSenha = TextEditingController();

  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text("Cadastro de Usuário")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: 
        [TextField(
            controller: controladorNome,
            decoration: InputDecoration(
              icon: const Icon(Icons.assignment_ind, color: Colors.blue,),
              hintText: "Nome"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller:controladorApartamento ,
            decoration: InputDecoration(
              icon: const Icon(Icons.house, color: Colors.blue,),
              hintText: "Apartamento"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller: controladorEmail ,
            decoration: InputDecoration(
              icon: const Icon(Icons.email, color: Colors.blue,),
              hintText: "Email"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller: controladorTelefone,
            decoration: InputDecoration(
              icon: const Icon(Icons.phone, color: Colors.blue,),
              hintText: "Telefone"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller: controladorSenha ,
            decoration: InputDecoration(
            icon: const Icon(Icons.password, color: Colors.blue,),
              hintText: "Senha"
            )
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () async {
          
             final response =  await repository.createData(
            controladorNome.text, 
            controladorApartamento.text,
            controladorEmail.text, 
            controladorTelefone.text, 
            controladorSenha.text );

           
              
              Navigator.popAndPushNamed(context, 'cadastro');
              
            
          },
          child: Text("Cadastrar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

        ],
        ),
      )
      );
      
       }
   
 
}