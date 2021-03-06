import 'package:cond2/boasvindas_page.dart';
import 'package:cond2/cctv.dart';
import 'package:cond2/create_page.dart';
import 'package:cond2/documentos.dart';
import 'package:cond2/financeiro.dart';
import 'package:cond2/login_page.dart';
import 'package:cond2/pagevisitas.dart';
import 'package:cond2/reservas.dart';
import 'package:cond2/visitas.dart';
import 'package:cond2/zap.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bem vindo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          elevation: 4,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 35,
              thickness: 5,
              indent: 10,
              endIndent: 10,
              color: Colors.black,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      'Comunicados Gerais:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      child: Text(
                        '- Lavagem da caixa d\'??gua no dia 20.05.2022 - Faltar?? ??gua das 8h ??s 14h.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      child: Text(
                        '- Dedetiza????o das ??reas comuns no dia 30.05.2022. ',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      child: Text(
                        '- Deposite o lixo residencial nos containers centrais at?? ??s 14 horas.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 10,
              color: Colors.black,
            ),
            Align(
              alignment: AlignmentDirectional(-0.15, -0.15),
              child: GridView(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  RaisedButton(
                    child: Text("Documentos",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Documentos(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Visitas",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageVisitas(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("CCTV",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cctv(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Cadastro",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePage(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Portaria",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Zap(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Financeiro",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Financeiro(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Reservas",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservas(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Sair",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Colors.lightBlue,
                    onPressed: () async {
                      bool saiu = await sair();
                      if (saiu) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BoasVindasPage()));
                      } else {}
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('CCTV'),
              onTap: () {
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cctv()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Cadastro'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreatePage()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.rule),
              title: Text('Documentos'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Documentos()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Financeiro'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Financeiro()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Portaria'),
              onTap: () {
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Zap()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Reservas'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reservas()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Visitas'),
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageVisitas()));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.outbond),
              title: Text('Sair'),
              onTap: () {
                setState(() async {
                  bool saiu = await sair();
                  if (saiu) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BoasVindasPage()));
                  } else {}
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> sair() async {
    SharedPreferences sharePreferences = await SharedPreferences.getInstance();
    await sharePreferences.clear();
    return true;
  }
}
