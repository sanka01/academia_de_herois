import 'package:flutter/material.dart';
import 'package:academia_de_herois/util/Util.dart';

import '../main.dart';

class PaginaAddHorario extends StatefulWidget {
  @override
  _PaginaAddHorarioState createState() => _PaginaAddHorarioState();
}

class _PaginaAddHorarioState extends State<PaginaAddHorario> {
  TextEditingController nomeController = TextEditingController();

  List<DropdownMenuItem<String>> _dropDownDiasSemana;
  List<DropdownMenuItem<String>> _dropDownHoras;
  List<DropdownMenuItem<String>> _dropDownTipos;

  BoxSelect dropDownDias;
  BoxSelect dropDownHora;
  BoxSelect dropDownTipo;

  String status = "";

  changedDropDownDias(String itemSelecionado) {
    setState(() {
      dropDownDias.changedDropDownItem(itemSelecionado);
    });
  }

  changedDropDownTipos(String itemSelecionado) {
    setState(() {
      dropDownTipo.changedDropDownItem(itemSelecionado);
    });
  }

  changedDropDownHoras(String itemSelecionado) {
    setState(() {
      dropDownHora.changedDropDownItem(itemSelecionado);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _add() {
    Map horario = {
      diasSemana[dropDownDias.itemSelecionado]:
          diasSemana[dropDownHora.itemSelecionado]
    };
    int tipo = tipos[dropDownTipo.itemSelecionado];
    setState(() {
      status = usuario.addHorario(tipo, horario);
    });
  }

  @override
  void initState() {
    dropDownDias = BoxSelect(diasSemana.keys.toList(), _dropDownDiasSemana);
    dropDownHora = BoxSelect(horas.keys.toList(), _dropDownHoras);
    dropDownTipo = BoxSelect(tipos.keys.toList(), _dropDownTipos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Horario Semanal"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(status),
                      Text(
                        "Adicione o Horario",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 30.0),
                      ),
                      DropdownButton(
                        value: dropDownDias.itemSelecionado,
                        items: dropDownDias.dropDownItens,
                        onChanged: changedDropDownDias,
                      ),
                      DropdownButton(
                        value: dropDownHora.itemSelecionado,
                        items: dropDownHora.dropDownItens,
                        onChanged: changedDropDownHoras,
                      ),
                      DropdownButton(
                        value: dropDownTipo.itemSelecionado,
                        items: dropDownTipo.dropDownItens,
                        onChanged: changedDropDownTipos,
                      ),
                      FlatButton(
                        child: Text("Adicionar"),
                        onPressed: _add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ))));
  }
}
