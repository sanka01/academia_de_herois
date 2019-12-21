import 'package:academia_de_herois/main.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

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

  String _getDataEscolhida() {
    if (_data == null) {
      return "";
    }
    return "${_data.day}/${_data.month}/${_data.year} - ${_data.hour}:${_data.minute}";
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
                            initialDate: _data == null ? DateTime.now() : _data,
                            firstDate: DateTime.now().add(Duration(days: -1)),
                            lastDate: DateTime(2021, 12, 31))
                        .then((data) {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((dataDia) {
                        setState(() {
                          _data = Jiffy(data).add(
                              hours: dataDia.hour, minutes: dataDia.minute);
                        });
                      });
                    });
                  },
                ),
                Text("data escolhida: " + _getDataEscolhida())
              ],
            ),
          ),
        ),
      );
}
