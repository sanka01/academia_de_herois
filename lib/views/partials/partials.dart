import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Professor.dart';
import 'package:academia_de_herois/model/pessoa/Responsavel.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:flutter/material.dart';

final Color verdeAcademia = Color.fromRGBO(42, 173, 170, 1);

getAppBar(String titulo) {
  return AppBar(
    title: Text(titulo),
    centerTitle: true,
    backgroundColor: verdeAcademia,
  );
}

getBottonBar(context) {
  return BottomAppBar(
      color: verdeAcademia,
      child: usuario is Responsavel
          ? bottonBarResponsavel(context)
          : usuario is Aluno
              ? bottonBarAluno(context)
              : usuario is Professor ? bottonBarProfessor(context) : "");
}

bottonBarProfessor(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      FlatButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.attach_money,
            color: Colors.white,
            size: MediaQuery.of(context).size.width / 6,
          ),
          label: Text("")),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.chat_bubble,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      botaoPerfil(context, 6)
    ],
  );
}

bottonBarAluno(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_basket,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      botaoPerfil(context, 6)
    ],
  );
}

bottonBarResponsavel(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_basket,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.chat_bubble,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 6,
        ),
        label: Text(""),
      ),
      botaoPerfil(context, 6)
    ],
  );
}

FlatButton botaoPerfil(context, int botoes) {
  var rota = ModalRoute.of(context).settings.name;
  debugPrint("rota: $rota");
  return FlatButton.icon(
    onPressed: rota == "/PerfilUsuario"
        ? null
        : () {
            Navigator.pushNamed(context, "/PerfilUsuario");
          },
    icon: Icon(
      Icons.perm_contact_calendar,
      color: Colors.white,
      size: MediaQuery.of(context).size.width / botoes,
    ),
    label: Text(""),
  );
}

botaoVerde(String texto, void funcao()) {
  return RaisedButton(
    color: verdeAcademia,
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
    child: Text(
      texto,
      style: TextStyle(color: Colors.white),
    ),
    onPressed: funcao,
  );
}

botaoTransparente(String texto, void funcao()) {
  return OutlineButton(
    color: Colors.white,
    borderSide: BorderSide(color: verdeAcademia),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
    child: Text(
      texto,
      style: TextStyle(color: verdeAcademia),
    ),
    onPressed: funcao,
  );
}

dividerAzul() {
  return Divider(
    indent: 10,
    endIndent: 10,
    color: verdeAcademia,
    thickness: 2.5,
  );
}

titulo({titulo, subtitulo}) {
  return Padding(
    padding: EdgeInsets.only(top: 18),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              titulo,
              style: TextStyle(color: verdeAcademia, fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                subtitulo,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        dividerAzul(),
      ],
    ),
  );
}
