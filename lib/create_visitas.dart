import 'package:cond2/person.dart';
import 'package:cond2/repository.dart';
import 'package:cond2/repositoryvisitas.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateVisitas extends StatefulWidget {
  const CreateVisitas({Key? key}) : super(key: key);

  @override
  State<CreateVisitas> createState() => _CreateVisitasState();
}

class _CreateVisitasState extends State<CreateVisitas> {
  final TextEditingController controladorNome = TextEditingController();
  final TextEditingController controladorData = TextEditingController();
 final _FormKey = GlobalKey<FormState>();

 var mask = MaskTextInputFormatter(mask: '##/##/####');
  RepositoryVisitas repositoryv = RepositoryVisitas();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Cadastro de Visitas")),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                key: _FormKey,
                  controller: controladorNome,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.assignment_ind,
                        color: Colors.blue,
                      ),
                       labelText: "Nome",
                      hintText: "Digite um nome")),
              SizedBox(height: 10),
              
              TextFormField(
                
                  keyboardType: TextInputType.number,
                  
                  inputFormatters: [mask],
                  controller: controladorData,
                  validator: (data) {
                          if (data == null )   return "Por favor, digite uma data";
                           return null;
                        },
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.house,
                        color: Colors.blue,
                      ),
                      labelText: "Data",
                      hintText: "DD/MM/AAAA")),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    final response = await repositoryv.createData(
                      controladorNome.text,
                      controladorData.text,
                    );

                    Navigator.popAndPushNamed(context, 'visitas');
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ));
  }
}
