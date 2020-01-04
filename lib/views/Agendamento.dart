import 'package:academia_de_herois/main.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
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

  String _getDataEscolhida() {
    if (_data == null) {
      return "";
    }
    return "data escolhida: ${_data.day}/${_data.month}/${_data.year} - ${_data.hour}:${_data.minute}";
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Agendamento"),
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
                RaisedButton(
                  child: Text("Escolha o horario"),
                  onPressed: () {
                    showDatePicker(
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light(),
                          child: child,
                        );
                      },
                      context: context,
                      initialDate: _data == null ? DateTime.now() : _data,
                      firstDate: DateTime.now().add(Duration(days: -1)),
                      lastDate: DateTime(2020, 12, 31),
                      selectableDayPredicate: (DateTime val) => professores
                              .firstWhere((professor) =>
                                  professor.nome ==
                                  dropDownProfessores.itemSelecionado)
                              .horariosIndisponiveis
                              .containsKey(val.weekday)
                          ? false
                          : true,
                    ).then((data) {
                      showTimePicker(
                              context: context,
                              builder: (BuildContext context, Widget child){
                                return Theme(
                                  data: ThemeData.light(),
                                  child: child,
                                );
                              },
                              initialTime: _data == null
                                  ? TimeOfDay.now()
                                  : TimeOfDay.fromDateTime(_data))
                          .then((horario) {
                        setState(() {
                          _data = DateTime(data.year, data.month, data.day,
                              horario.hour, horario.minute);
                        });
                      });
                    });
                  },
                ),
                Text(_getDataEscolhida())
              ],
            ),
          ),
        ),
      );
}
