
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PagePdf1 extends StatefulWidget {
  const PagePdf1({ Key? key }) : super(key: key);

  @override
  _PagePdf1State createState() => _PagePdf1State();
}

class _PagePdf1State extends State<PagePdf1> {
  String url = "http://www.pdf995.com/samples/pdf.pdf";
  String url2 = "https://www.thecampusqdl.com/uploads/files/pdf_sample_2.pdf";
  String pdfasset = "assets/sample2.pdf";
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
    
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc= doc;
      _loading = false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Regimento Interno"),
      
       actions: <Widget>[
                  
          
          
        ],
    
      ),
      
      body: _loading 
      ? Center(child: CircularProgressIndicator(),) 
      : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
   
         
       
      // showIndicator: false,
      // showPicker: false,
       ),
  );
  }
}
