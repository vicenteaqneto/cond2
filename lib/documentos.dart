

import 'dart:math';
import 'package:cond2/boletos.dart';
import 'package:cond2/pagepdf1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Documentos extends StatefulWidget {
  const Documentos({ Key? key }) : super(key: key);

  @override
  _DocumentosState createState() => _DocumentosState();
}

class _DocumentosState extends State<Documentos> {

  
 
String url = "http://www.pdf995.com/samples/pdf.pdf";
  String pdfasset = "images/pdfexemplo.pdf";
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
       return  Scaffold(
           appBar: AppBar(title: Text("Documentos",
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
                          leading: Icon(Icons.text_snippet_outlined),
                          title: Text('Regimento Interno'),
                          onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (BuildContext context) => PagePdf1(),),);
                          },
                           subtitle: Text('Normas do condomínio'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
   
    ),
    Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                         child: ListTile(
                          leading: Icon(Icons.text_snippet_outlined),
                          title: Text('Churrasqueiras'),
                           onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (BuildContext context) => Boletos(),),);
                          },
                           subtitle: Text('Normas das Churrasqueiras'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
       ),
       Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                         child: ListTile(
                          leading: Icon(Icons.text_snippet_outlined),
                          title: Text('Piscinas'),
                           onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (BuildContext context) => Boletos(),),);
                          },
                           subtitle: Text('Normas das Piscinas'),
                            trailing: Icon(Icons.arrow_forward_ios),
             ),
   
    ),
                ],
                
    ),
    
   ),
   
     );
    
  }

  
}
