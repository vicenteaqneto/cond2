
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Boletos extends StatefulWidget {
  const Boletos({ Key? key }) : super(key: key);

  @override
  _BoletosState createState() => _BoletosState();
}

class _BoletosState extends State<Boletos> {

  String url = "http://www.pdf995.com/samples/pdf.pdf";
 String url2 = "https://www.thecampusqdl.com/uploads/files/pdf_sample_2.pdf";
  String pdfasset = "images/pdfexemplo.pdf";
  late PDFDocument _doc;
  late PDFDocument _doc2;
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
    final doc = await PDFDocument.fromAsset('images/pdfexemplo.pdf');
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  Color textColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Documento"),
      
       actions: <Widget>[
                    
          
        ],
    
      ),
      
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
   
         
       
      // showIndicator: false,
      // showPicker: false,
       ),
       
    );
  }
}