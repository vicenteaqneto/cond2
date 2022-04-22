



import 'package:cond2/boletos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Financeiro extends StatefulWidget {
  const Financeiro({ Key? key }) : super(key: key);

  @override
  _FinanceiroState createState() => _FinanceiroState();
}

class _FinanceiroState extends State<Financeiro> {
String url = "http://www.pdf995.com/samples/pdf.pdf";
  String pdfasset = "assets/sample.pdf";
  late PDFDocument _doc;
   late bool _loading;

  @override
  void initState() { 
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(title: Text("Taxa Condominial",
            style: TextStyle(fontSize: 20,
             fontWeight: FontWeight.bold))),
           body: SafeArea(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                         child: ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Fevereiro 2022'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Boletos(),),);
                          },
                           subtitle: Text('Pendente'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
   
    ),
    Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                         child: ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Janeiro 2022'),
                           onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Boletos(),),);
                          },
                           subtitle: Text('Pago'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
       ),
       Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                         child: ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Dezembro 2021'),
                           onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Boletos(),),);
                          },
                           subtitle: Text('Pago'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
   
    ),
                ],
    )
   ),
   
     );
    
  }
}