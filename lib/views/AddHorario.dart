import 'package:flutter/material.dart';
import 'package:academia_de_herois/util/Util.dart';

class PaginaAddHorario extends StatefulWidget {
  @override
  _PaginaAddHorarioState createState() => _PaginaAddHorarioState();
}

class _PaginaAddHorarioState extends State<PaginaAddHorario> {
  TextEditingController nomeController = TextEditingController();

  List<DropdownMenuItem<String>> _dropDownDiasSemana;
  List<DropdownMenuItem<String>> _dropDownHoras;
  List<DropdownMenuItem<String>> _dropDownTipos;

  _BoxSelect dropDownDias;
  _BoxSelect dropDownHora;
  _BoxSelect dropDownTipo;

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
    List horario = [
      dropDownDias._itens[dropDownDias._itemSelecionado],
      dropDownHora._itens[dropDownHora._itemSelecionado]
    ];
    int tipo = dropDownTipo._itens[dropDownTipo._itemSelecionado];
    setState(() {
      status = usuario.addHorario(tipo, horario);
    });
  }

  @override
  void initState() {
    dropDownDias = _BoxSelect(diasSemana, _dropDownDiasSemana);
    dropDownHora = _BoxSelect(horas, _dropDownHoras);
    dropDownTipo = _BoxSelect(tipos, _dropDownTipos);
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
                        value: dropDownDias._itemSelecionado,
                        items: dropDownDias._dropDownItens,
                        onChanged: changedDropDownDias,
                      ),
                      DropdownButton(
                        value: dropDownHora._itemSelecionado,
                        items: dropDownHora._dropDownItens,
                        onChanged: changedDropDownHoras,
                      ),
                      DropdownButton(
                        value: dropDownTipo._itemSelecionado,
                        items: dropDownTipo._dropDownItens,
                        onChanged: changedDropDownTipos,
                      ),
                      FlatButton(
                        child: Text("Add"),
                        onPressed: _add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ))));
  }
}

class _BoxSelect {
  Map<String, int> _itens;

  String _itemSelecionado;
  List<DropdownMenuItem<String>> _dropDownItens;

  _BoxSelect(this._itens, this._dropDownItens) {
    _dropDownItens = getDropDownItens();
    _itemSelecionado = _itens.keys.first;
  }

  List<DropdownMenuItem<String>> getDropDownItens() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in _itens.keys.toList()) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  String changedDropDownItem(String itemSelecionado) {
    _itemSelecionado = itemSelecionado;
    return _itemSelecionado;
  }
}
