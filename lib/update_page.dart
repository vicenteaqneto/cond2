
import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({ Key? key }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
 

final TextEditingController controladorNome = TextEditingController();
final TextEditingController controladorApartamento = TextEditingController();
final TextEditingController controladorEmail = TextEditingController();
final TextEditingController controladorTelefone = TextEditingController();


  Repository repository = Repository();
 
  @override
  Widget build(BuildContext context) {
   final args = ModalRoute.of(context)?.settings.arguments as List<String>;
   
    
  if (args[1].isNotEmpty) {
    controladorNome.text =args[1];
  } 
  if (args[2].isNotEmpty) {
    controladorApartamento.text = args[2];
  } 
  if(args[3].isNotEmpty) {
    controladorEmail.text =args[3];
  } 
  if (args[4].isNotEmpty) {
    controladorTelefone.text =args[4];
  } 
  
 

    return Scaffold(
      appBar: AppBar(
        title: Text("Alteração de Usuário")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
      child:  Column(children: [
          TextField(
            controller: controladorNome,
            decoration: InputDecoration(
              icon: const Icon(Icons.assignment_ind),
              hintText: "Nome"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller:controladorApartamento ,
            decoration: InputDecoration(
              icon: const Icon(Icons.house),
              hintText: "Apartamento"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller: controladorEmail ,
            decoration: InputDecoration(
              icon: const Icon(Icons.email),
              hintText: "Email"
            )
          ),
          SizedBox(height: 10),
          TextField(
            controller: controladorTelefone,
            decoration: InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: "Telefone"
            )
          ),
          SizedBox(height: 10),
          
          SizedBox(height: 10),
          
          ElevatedButton(onPressed: ()async{
           bool response =  await repository.alterar(
            args[0],
           controladorNome.text, 
           controladorApartamento.text,
           controladorEmail.text, 
           controladorTelefone.text, );
           
              
                 Navigator.popAndPushNamed(context, 'cadastro');
    
          
               
          }, 
          child: Text("Atualizar"))
        ],
      )
      )
      );
      
       }
   

}