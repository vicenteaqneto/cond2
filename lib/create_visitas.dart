

import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:cond2/repositoryvisitas.dart';
import 'package:flutter/material.dart';

class CreateVisitas extends StatefulWidget {
  const CreateVisitas({ Key? key }) : super(key: key);

  @override
  State<CreateVisitas> createState() => _CreateVisitasState();
}

class _CreateVisitasState extends State<CreateVisitas> {


final TextEditingController controladorNome = TextEditingController();
final TextEditingController controladorData = TextEditingController();


  RepositoryVisitas repositoryv = RepositoryVisitas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text("Cadastro de Visitas")
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
            controller:controladorData ,
            decoration: InputDecoration(
              icon: const Icon(Icons.house, color: Colors.blue,),
              hintText: "Data"
            )
          ),
          SizedBox(height: 10),
         
          ElevatedButton(onPressed: () async {
          
             final response =  await repositoryv.createData(
            controladorNome.text, 
            controladorData.text,
            );

           
              
              Navigator.popAndPushNamed(context, 'visitas');
              
            
          },
          child: Text("Cadastrar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

        ],
        ),
      )
      );
      
       }
   
 
}