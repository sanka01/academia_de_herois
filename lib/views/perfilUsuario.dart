import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Professor.dart';
import 'package:academia_de_herois/model/pessoa/Responsavel.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaPerfilUsuario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaPerfilUsuarioState();
}

class _PaginaPerfilUsuarioState extends State<PaginaPerfilUsuario> {
  List<bool> enderecos = [false, true];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: getAppBar("Perfil"),
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
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
                          "Membro desde ${usuario.dataCriacao?.month ?? ""}, ${usuario.dataCriacao?.year ?? ""}"),
                      Text(usuario?.bio ?? ""),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: verdeAcademia,
              height: 1,
              indent: 10,
              endIndent: 10,
              thickness: 1,
            ),
            titulo(
                titulo: "  Informações Privativas",
                subtitulo: "(Usamos esses dados apenas por segurança e\n"
                    " nunca compartilhamos com outros usuários)."),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("CPF:"),
                      Text("000.000.000-00"),
                      botaoVerde("Editar perfil", () {})
                    ],
                  ),
                ],
              ),
            ),
            titulo(
                titulo: "   Formas de Pagamentos",
                subtitulo: "(Dados bancarios cadastrados)"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Cartão"),
                      Text("Boleto"),
                      Text("Dinheiro")
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      botaoTransparente("Historico de \npagamento", () {})
                    ],
                  )
                ],
              ),
            ),
            titulo(
                titulo: "    Endereços",
                subtitulo:
                "(Insira seu endereço para que \n   possa receber pedidos ou atender clientes)."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[Text("Endereço:"), Text("ENDEREÇO TESTE")],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: enderecos[0],
                      onChanged: (value) {
                        setState(() {
                          enderecos.setAll(
                              0, List.filled(enderecos.length, false));
                          enderecos[0] = value;
                        });
                      },
                      tristate: false,
                    ),
                    Text("Usar este")
                  ],
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      Text("Excluir endereço")
                    ],
                  ),
                )
              ],
            ),
            usuario is Responsavel
                ? Column(
              children: <Widget>[
                titulo(
                    titulo: "    Estudante",
                    subtitulo:
                    "(Acompanhe as informações do(s)\n     estudante(s) que você é responsável)."),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Nome:"),
                          Text("Filhote 1"),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5)),
                          Text("Escola: "),
                          Text("XXXXXXXXXXXXX"),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5)),
                          Text("Dificuldades: "),
                          Text("XXXXXXXXXXXXXX")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Data de Nascimento: "),
                          Text("00/00/0000"),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5)),
                          Text("Periodo que estuda: "),
                          Text("00/00/0000")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Telefone: "),
                          Text("00000-0000"),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 5)),
                          Text("Ano:  "),
                          Text("Segundo ano")
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      botaoVerde("Editar Estudante", () {}),
                      botaoTransparente("Adicionar novo", () {})
                    ],
                  ),
                )
              ],
            )
                : usuario is Aluno ? Text("") : usuario is Professor ? Text("") : Text(""),
            titulo(titulo: "", subtitulo: ""),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  botaoVerde("Alterar Senha", () {}),
                  botaoVerde("Sair", () {})
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: getBottonBar(context));
}
