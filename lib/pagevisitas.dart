

import 'package:cond2/repositoryvisitas.dart';
import 'package:cond2/visitas.dart';
import 'package:flutter/material.dart';

class PageVisitas extends StatefulWidget {
  
  const PageVisitas({ Key? key }) : super(key: key);

  @override
  State<PageVisitas> createState() => _PageVisitasState();
}

class _PageVisitasState extends State<PageVisitas> {
  
  RepositoryVisitas repositoryv = RepositoryVisitas();
  List <Visitas> listVisitas = [];
  getData() async  {
    listVisitas =  await  repositoryv.getData();
  setState(() {
    
  });
}
@override
  void initState() {
  getData();
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista de Visitantes')
      ),
      body: ListView.builder(
        itemCount: listVisitas.length,
        itemBuilder: (context, index){
          Visitas visitas = listVisitas[index];
          return InkWell(
            onTap: (){
                
                Navigator.popAndPushNamed(context, 'updatevisitas',  arguments: [
                ('${visitas.id}') ,
                ('${visitas.nome}'),
                ('${visitas.data}'),
              
                    ] );
            },
            child: Dismissible(
             key: Key(visitas.id.toString()),
              direction: DismissDirection.endToStart,
              background: Container(alignment: Alignment.centerRight, 
              padding: EdgeInsets.symmetric(horizontal: 30),
              
              child: Icon(Icons.delete),
              
              ),
              
              confirmDismiss: (direction){
               
                return showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Delete Dados'),
                    content: Text('Confirmar? '),
                    actions: [TextButton(onPressed: ()async{
                      bool response = await  repositoryv.deleteData((visitas.id.toString()));
                          
                          if (response) {
                            Navigator.pop(context, true);
                          }else{
                            Navigator.pop(context, false);
                          }
                          }, child: Text('Sim')),
                      TextButton(onPressed: (){
                        Navigator.pop(context, false);
                                              
                        
                          
                      }, child: Text('Não'))],
                  );
                }
                );
              },
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                
                   decoration: BoxDecoration(
                   shape:BoxShape.circle,
                  color: Colors.blue,
                  
                     ),
                ),
                title: Text('${visitas.nome}'),
                subtitle: Text(" Data: "+'${visitas.data}'
                      ),
                 ),
            ),
          );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
              Navigator.popAndPushNamed(context,'createvisitas');
              
          },
       child:  Icon( Icons.add),
       ),
        
    );
  }
}