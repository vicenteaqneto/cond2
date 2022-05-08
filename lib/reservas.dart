import 'package:cond2/calendario.dart';
import 'package:flutter/material.dart';

class Reservas extends StatefulWidget {
  const Reservas({Key? key}) : super(key: key);

  @override
  State<Reservas> createState() => _ReservasState();
}

class _ReservasState extends State<Reservas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Reservas",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
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
              title: Text('Churrasqueira'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Calendario(),
                  ),
                );
              },
              subtitle: Text('Reserva da Churrasqueira'),
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
              title: Text('Salão de Festas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Calendario(),
                  ),
                );
              },
              subtitle: Text('Reserva do Salão de Festas'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      )),
    );
  }
}
