import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mysql1/mysql1.dart';

class TesteDB extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TesteDBState();

}
class _TesteDBState extends State<TesteDB>{
  Future<Results> data;
  MySqlConnection conn;
  var settings = ConnectionSettings(
      host: '185.201.11.233',
//      port: 3306,
      user: 'u560390099_sanka',
      password: '1C1d2M1@d2@H3r43s',
      db: 'u560390099_app'
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Teste"),
      centerTitle: true,
    ),
    body: Text(data.toString()),
  );

  @override
  void initState(){
    data = getData();
  }
  Future<Results> getData() async{
//    var url = 'app.academiadeherois.online/get.php';
//    http.Response response = await http.get(url);
//    var data = jsonDecode(response.body);
//    print("dados retornados == " + data.toString());
//    return data;
    debugPrint("Tentando se conectar...");
    connection();
    debugPrint("Conexão bem sucedida, iniciando consulta SQL");
    Results results = await conn.query("select * from Pessoa where id = ?",[1] );
    debugPrint("SUCESSO:");
//    for (var row in results) {
//      debugPrint('Name: ${row[0]}');
//    }
    return results;
  }


  Future connection() async {
    conn = await MySqlConnection.connect(settings);
  }

}