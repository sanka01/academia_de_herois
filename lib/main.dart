import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/AddHorario.dart';
import 'package:academia_de_herois/views/Agendamento.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Academia de Herois",
      home: PaginaInicial(),
      routes: {
        "/home": (context) => PaginaInicial(),
        "/AddHorario": (context) => PaginaAddHorario(),
        "/AgendarAula": (context) => PaginaAgendamento()
      },
    ));

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Testes"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Text(usuario.toString()),
            Center(
              child: RaisedButton(
                  child: Text("Add Horario"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/AddHorario');
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("Agendar"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/AgendarAula');
                  }),
            )
          ],
        )));
  }
}
