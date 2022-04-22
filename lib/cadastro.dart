
import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  
  const Cadastro({ Key? key }) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  
  Repository repository = Repository();
  List <Person> listPerson = [];
  getData() async  {
    listPerson =  await  repository.getData();
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
        title: Text('Cadastro de Usuários')
      ),
      body: ListView.builder(
        itemCount: listPerson.length,
        itemBuilder: (context, index){
          Person person = listPerson[index];
          return InkWell(
            onTap: (){
                
                Navigator.popAndPushNamed(context, 'update',  arguments: [
                ('${person.id}') ,
                ('${person.nome}'),
                ('${person.apartamento}'),
                ('${person.email}'),
                ('${person.telefone}'),
                ('${person.senha}'),
                    ] );
            },
            child: Dismissible(
             key: Key(person.id),
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
                      bool response = await  repository.deleteData((person.id));
                          
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
                title: Text('${person.nome}'),
                subtitle: Text(" Apartamento: "+'${person.apartamento}'+" \n "+
                     "Email: "+'${person.email}' +"\n  "+
                      "Telefone: "+'${person.telefone}'
                      ),
                 ),
            ),
          );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
              Navigator.popAndPushNamed(context,'create');
              
          },
       child:  Icon( Icons.add),
       ),
        
    );
  }
}