
import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
var mask = MaskTextInputFormatter(mask: '###');
var mask2 = MaskTextInputFormatter(mask: '(##) # ####-####');

final _FormKey = GlobalKey<FormState>();

  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text("Atualização de Cadastro")
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
          TextFormField(
            key:_FormKey,
            controller:controladorApartamento ,
            inputFormatters: [mask],
            decoration: InputDecoration(
              icon: const Icon(Icons.house, color: Colors.blue,),
              labelText: "Apartamento",
              hintText: "XXX",
              
            )
          ),
          SizedBox(height: 10),
          TextField(
            
            controller: controladorEmail ,
            
            decoration: InputDecoration(
              icon: const Icon(Icons.email, color: Colors.blue,),
              labelText: "Email",
              hintText: "xxxx@xxxx.com"
            )
          ),
          SizedBox(height: 10),
          TextField(
          
            controller: controladorTelefone,
            inputFormatters: [mask2],
            decoration: InputDecoration(
              icon: const Icon(Icons.phone, color: Colors.blue,),
              labelText: "Telefone",
              hintText: "(99) 9 9999-9999"
            )
          ),
                    
          SizedBox(height: 10),
          ElevatedButton(onPressed: () async {
          
             final response =  await repository.createData(
            controladorNome.text, 
            controladorApartamento.text,
            controladorEmail.text, 
            controladorTelefone.text, 
            
             );
           
              
              Navigator.popAndPushNamed(context, 'cadastro');
              
            
          },
          child: Text("Cadastrar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

        ],
        ),
      )
      );
      
       }
   
 
}