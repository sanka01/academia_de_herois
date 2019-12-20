import 'package:academia_de_herois/main.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaAgendamento extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaAgendamentoState();
}

class _PaginaAgendamentoState extends State {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BoxSelect dropDownProfessores;
  List<DropdownMenuItem<String>> _dropDownProfessores;

  DateTime _data;

  changedDropDownProfessores(String itemSelecionado) {
    setState(() {
      dropDownProfessores.changedDropDownItem(itemSelecionado);
    });
  }

  @override
  void initState() {
    dropDownProfessores = BoxSelect(professores, _dropDownProfessores);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Agendamento"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Escolha o Professor:"),
                ),
                DropdownButton(
                  value: dropDownProfessores.itemSelecionado,
                  items: dropDownProfessores.dropDownItens,
                  onChanged: changedDropDownProfessores,
                ),
                FlatButton(
                  child: Text("Escolha o horario"),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate:_data == null ? DateTime.now(): _data,
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2021))
                        .then((data) {
                          setState(() {
                            _data = data;
                          });
                    });
                  },
                ),
                Text("data escolhida: ${_data.day}/${_data.month}/${_data.year}")
              ],
            ),
          ),
        ),
      );
}
