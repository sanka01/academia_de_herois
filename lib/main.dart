import 'package:academia_de_herois/model/pessoa/Professor.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(title: "Academia de Herois", home: PaginaInicial()));

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController nomeController = TextEditingController();

  Professor professor = Professor();
  Map<String, int> diasSemana = {
    "Domingo": 0,
    "Segunda-Feira": 1,
    "Terça-Feira": 2,
    "Quarta-Feira": 3,
    "Quinta-Feira": 4,
    "Sexta-Feira": 5,
    "Sabado": 6
  };

  String _diaAtual;
  List<DropdownMenuItem<String>> _dropDownDiasSemana;


  String _horaAtual;
  List<DropdownMenuItem<String>> _dropDownHoras;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _add() {
    setState(() {
      professor.nome = nomeController.text;
    });
  }

  @override
  void initState() {
    _dropDownDiasSemana = getDropDownDiasSemana();
    _diaAtual = diasSemana.keys.first;

    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownDiasSemana() {
    List<DropdownMenuItem<String>> items = new List();
    for (String diaSemana in diasSemana.keys.toList()) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
          new DropdownMenuItem(value: diaSemana, child: new Text(diaSemana)));
    }
    return items;
  }

  void changedDropDownItem(String diaSelecionado) {
    setState(() {
      _diaAtual = diaSelecionado;
    });
  }

  List<DropdownMenuItem<String>> getDropDownHorario() {
    List<DropdownMenuItem<String>> items = new List();
    for (String diaSemana in diasSemana.keys.toList()) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
          new DropdownMenuItem(value: diaSemana, child: new Text(diaSemana)));
    }
    return items;
  }

  void changedDropDownHora(String horaSelecionada) {
    setState(() {
      _diaAtual = horaSelecionada;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Testes"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(professor.nome),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Coloque o nome",
                        labelStyle: TextStyle(color: Colors.cyanAccent)),
                    controller: nomeController,
                  ),
                  DropdownButton(
                    value: _diaAtual,
                    items: _dropDownDiasSemana,
                    onChanged: changedDropDownItem,
                  ),
                  DropdownButton(
                    value: _diaAtual,
                    items: _dropDownDiasSemana,
                    onChanged: changedDropDownItem,
                  ),
                  FlatButton(
                    child: Text("Add"),
                    onPressed: _add,
                    color: Colors.white,
                  ),
                ],
              ),
            )));
  }
}



