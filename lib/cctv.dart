

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'menu.dart';

class Cctv extends StatefulWidget {
  const Cctv({Key? key}) : super(key: key);

  @override
  _CctvState createState() => _CctvState();
}

class _CctvState extends State<Cctv> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

@override
   void initState() {
     super.initState();
     // Enable virtual display.
      WebView.platform = SurfaceAndroidWebView();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ),
            );
          },
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.95),
                child: Text(
                  'CCTV',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                   width: 400,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.yellow),
                  
                  child: WebView(
                 
                    initialUrl: 'https://daer.kopp.com.br/ftp/imagem.php?id=Glorinha',
                    
                  ),
                ),
              ),
             
               SizedBox(height: 30),
               Expanded(
                child: Container(
                   width: 400,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: WebView(
                    initialUrl: 'https://www.climaaovivo.com.br/pb/joao-pessoa/joao-pessoa-marcelo-zurita-bramon',
                    
                  ),
                ),
              ),
              IconButton(
                
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}