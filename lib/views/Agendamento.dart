import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaAgendamento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PaginaAgendamentoState();

}


class _PaginaAgendamentoState extends State{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
   appBar: AppBar(
     title: Text("Agendamento"),
   ),
    body:   SingleChildScrollView(
     child: Form(
       key: _formKey,
       child: Column(
         children: <Widget>[
           Center(
             child: Text("OLA"),
           )
         ],
       ),
     ),
   ),
  );

}