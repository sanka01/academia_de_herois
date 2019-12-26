import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/AddHorario.dart';
import 'package:academia_de_herois/views/Agendamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MaterialApp(
    title: "Academia de Herois",
    home: PaginaInicial(),
    routes: {
      "/home": (context) => PaginaInicial(),
      "/AddHorario": (context) => PaginaAddHorario(),
      "/AgendarAula": (context) => PaginaAgendamento()
    },
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: Locale('pt', 'BR'),
    supportedLocales: {Locale('pt', 'BR'), Locale('en')}
    ));

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) => Scaffold(
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

class BoxSelect {
  List itens;

  String _itemSelecionado;

  String get itemSelecionado => _itemSelecionado;

  List<DropdownMenuItem<String>> dropDownItens;

  BoxSelect(this.itens, this.dropDownItens) {
    dropDownItens = getDropDownItens();
    _itemSelecionado = itens.first.toString();
  }

  List<DropdownMenuItem<String>> getDropDownItens() {
    List<DropdownMenuItem<String>> items = new List();
    for (var item in itens) {
      items.add(new DropdownMenuItem(
          value: item.toString(),
          child: new Text(
            item.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15),
          )));
    }
    return items;
  }

  String changedDropDownItem(String itemSelecionado) {
    _itemSelecionado = itemSelecionado;
    return _itemSelecionado;
  }
}
