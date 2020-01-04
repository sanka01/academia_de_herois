import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mysql1/mysql1.dart';

class TesteDB2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TesteDBState2();
}

class _TesteDBState2 extends State<TesteDB2> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Lista de Pessoas"),),
    body: FutureBuilder<List<Pessoa>>(
      future: fetchPessoas(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView(
          children: snapshot.data
              .map((data) => ListTile(
            title: Text(data.nome),
            onTap: () {
              print(data.nome);
            },
          ))
              .toList(),
        );
      },
    ),
  );

  Future<List<Pessoa>> fetchPessoas() async {
    debugPrint("Tentando conexão");
    var response = await http.post(uri,body: {"acao": "GET_ALL"} );
    debugPrint("Conexão bem sucedida");

    if (response.statusCode == 200) {
      debugPrint("Response == " +response.body);
      debugPrint("Decodificando itens");
      var itens = json.decode(response.body).cast<Map<String, dynamic>>();
      debugPrint("Itens decodificados:");
      debugPrint(itens.toString());
      debugPrint("Inserindo JSON na lista de Pessoas");
      List<Pessoa> pessoas = itens.map<Pessoa>((json) {
        debugPrint(json.toString());
        return Pessoa.fromJson(json);
      }).toList();

      debugPrint("Pessoas encontradas:");
      pessoas.forEach((f){
        debugPrint(f.toString());
      });
      return pessoas;
    } else
      throw Exception("Falha ao carregar dados");
  }
}
