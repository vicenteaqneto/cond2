import 'package:cond2/login_page.dart';
import 'package:cond2/menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({ Key? key }) : super(key: key);

  @override
  State<BoasVindasPage> createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarToken().then((value){
      if(value){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=> Menu()));
      }else{
         Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=> Login()));

      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
      
    );
  }
  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null){
      return false;
    }else{
      return true;
    }
  }
}