import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AulasAgendadasProfessor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AulasAgendadasProfessorState();
}

class _AulasAgendadasProfessorState extends State<AulasAgendadasProfessor> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(
                "Você tem X aulas agendadas para hoje.",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "A previsão é de mais X aulas para esse mês.",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          backgroundColor: verdeAcademia,
        ),
    body: Column(
      children: <Widget>[
        titulo(titulo: "Aulas solicitadas(X)")
      ],
    ),
      );
}
