import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaPerfilUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Perfil"),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    usuario?.imagemPerfil ?? "assets/images/perfil.jpg",
                    height: 80,
                    width: 80,
                  ),
                  Column(
                    children: <Widget>[
                      Text(usuario?.nome ?? "Nome do Usuario"),
                      Text(
                          "Membro desde ${usuario.dataCriacao.month}, ${usuario.dataCriacao.year}"),
                      Text(usuario?.bio ?? ""),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 1,
              indent: 10,
              endIndent: 10,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18),
              child: Row(
                children: <Widget>[
                  Text(
                    "  Informações Privativas",
                    style: TextStyle(color: Colors.cyan, fontSize: 18),
                  ),
                  Text(
                    "(Usamos esses dados apenas por segurança e\n"
                    " nunca compartilhamos com outros usuários).",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.blue,
              thickness: 2.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Sexo:"),
                      Text(
                        "Masculino",
                        style: TextStyle(fontSize: 10),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text("Contato:"),
                      Text(
                        "(63) 92000-0949",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Data de Nascimento:"),
                    Text(
                      "00/00/0000",
                      style: TextStyle(fontSize: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Text("Email:"),
                    Text("meuemail@email.com", style: TextStyle(fontSize: 10))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("CPF:"),
                    Text("000.000.000-00"),
                    botaoVerde("Editar perfil", (){})

                  ],
                )
              ],
            )
          ],
        ),
      );
}
