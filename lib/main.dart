import 'package:academia_de_herois/model/pessoa/Professor.dart';
import 'package:academia_de_herois/model/pessoa/Responsavel.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/AddHorario.dart';
import 'package:academia_de_herois/views/Agendamento.dart';
import 'package:academia_de_herois/views/AulasAgendadasProfessor.dart';
import 'package:academia_de_herois/views/Cadastro.dart';
import 'package:academia_de_herois/views/Login.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:academia_de_herois/views/perfilUsuario.dart';
import 'package:academia_de_herois/views/ListarPessoas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'model/pessoa/Aluno.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    title: "Academia de Herois",
    debugShowCheckedModeBanner: false,
    checkerboardOffscreenLayers: true,
    home: PaginaTestes(),
    routes: {
      "/home": (context) => PaginaTestes(),
      "/AddHorario": (context) => PaginaAddHorario(),
      "/Login": (context) => PaginaLogin(),
      "/Cadastro": (context) => PaginaCadastro(),
      "/PerfilUsuario": (context) => PaginaPerfilUsuario(),
      "/AgendarAula": (context) => PaginaAgendamento(),
      "/ListarPessoas": (context) => ListarPessoas(),
      "/AulasAgendadasProfessor": (context) => AulasAgendadasProfessor(),
    },
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: Locale('pt', 'BR'),
    supportedLocales: {Locale('pt', 'BR'), Locale('en')}));
}

class PaginaTestes extends StatefulWidget {
  @override
  _PaginaTestesState createState() => _PaginaTestesState();
}

class _PaginaTestesState extends State<PaginaTestes> {
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Testes"),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Text(
              "Perfil atual: $usuario",
              style: TextStyle(fontSize: 20),
            ),
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
            ),
            Center(
              child: RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/Login');
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("Cadastrar"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/Cadastro');
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("Perfil Usuario"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/PerfilUsuario');
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("Listar Usuarios cadastrados"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/ListarPessoas');
                  }),
            ),
            Center(
              child: RaisedButton(
                  child: Text("Aulas Agendadas"),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/AulasAgendadasProfessor');
                  }),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Professor"),
                    onPressed: () {
                      setState(() {
                        usuario = Professor(nome: "Professor");
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("Aluno"),
                    onPressed: () {
                      setState(() {
                        usuario = Aluno(nome: "Aluno");
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("Responsavel"),
                    onPressed: () {
                      setState(() {
                        usuario = Responsavel(nome: "Responsavel");
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: getBottonBar(context),
      );
}

class BoxSelect {
  List itens;

  String itemSelecionado;

  List<DropdownMenuItem<String>> dropDownItens;

  BoxSelect(this.itens, this.dropDownItens) {
    dropDownItens = getDropDownItens();
    itemSelecionado = itens.first.toString();
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
    itemSelecionado = itemSelecionado;
    return itemSelecionado;
  }
}
