import 'package:flutter/material.dart';

getAppBar(String titulo) {
  return AppBar(
      title: Text(titulo),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(42, 173, 170, 1),

  );
}
botaoVerde(String texto, void funcao()){
  return RaisedButton(
    color: Color.fromRGBO(42, 173, 170, 1),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
    child: Text(texto, style: TextStyle(color: Colors.white),),
    onPressed: funcao,
  );
}

