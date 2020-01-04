import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListarPessoas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListarPessoasState();
}

class _ListarPessoasState extends State<ListarPessoas> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Lista de Pessoas"),
        body: FutureBuilder<List<Pessoa>>(
          future: fetchPessoas(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView(
              children: snapshot.data
                  .map((data) => ListTile(
                        title: Text(data.nome),
                        onTap: () {},
                      ))
                  .toList(),
            );
          },
        ),
        bottomNavigationBar: getBottonBar(context),
      );

  Future<List<Pessoa>> fetchPessoas() async {
    var response = await http.post(uri, body: {"acao": "GET_ALL"});

    if (response.statusCode == 200) {
      var itens = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Pessoa> pessoas = itens.map<Pessoa>((json) {
        return Pessoa.fromJson(json);
      }).toList();
      return pessoas;
    } else
      throw Exception("Falha ao carregar dados");
  }
}
