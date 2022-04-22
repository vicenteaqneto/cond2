


import 'package:cond2/pagevisitas.dart';
import 'package:cond2/repositoryvisitas.dart';
import 'package:flutter/material.dart';

class UpdateVisitas extends StatefulWidget {
  const UpdateVisitas({ Key? key }) : super(key: key);

  @override
  State<UpdateVisitas> createState() => _UpdateVisitasState();
}

class _UpdateVisitasState extends State<UpdateVisitas> {
 

final TextEditingController controladorNome = TextEditingController();
final TextEditingController controladorData = TextEditingController();


  RepositoryVisitas repository = RepositoryVisitas();
 
  @override
  Widget build(BuildContext context) {
   final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    
  if (args[1].isNotEmpty) {
    controladorNome.text =args[1];
  } 
  if (args[2].isNotEmpty) {
    controladorData.text = args[2];
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
            controller:controladorData ,
            decoration: InputDecoration(
              icon: const Icon(Icons.timer),
              hintText: "Apartamento"
            )
          ),
          
          SizedBox(height: 10),
          
          ElevatedButton(onPressed: ()async{
        
       
         bool response =  await repository.alterar(
        args[0],
           controladorNome.text, 
           controladorData.text,
         );
              
                Navigator.popAndPushNamed(context, 'visitas');
    
    
          
               
          }, 
          child: Text("Atualizar"))
        ],
      )
      )
      );
      
       }
   

}