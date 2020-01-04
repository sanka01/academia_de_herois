import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaCadastro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final _formKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var telefoneController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  var senhaConfirmController = TextEditingController();

  String notice = "";

  void _cadastrar() {
    Pessoa novoUsuario = Pessoa.novoUsuario(nomeController.text,
        telefoneController.text, emailController.text, senhaController.text);
    if (novoUsuario.salvar(novoUsuario)) {
      setState(() {
        notice = "Usuario Cadastrado com sucesso";
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Cadastro"),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 50),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/logo.png")),
//                  Text("Cadastro",
//                      style: TextStyle(
//                          color: Color.fromRGBO(42, 173, 170, 1),
//                          fontSize: 16)),
                    Text(notice),
                    TextFormField(
                      controller: nomeController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Nome não pode ser vazio";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusColor: Color.fromRGBO(42, 173, 170, 1),
                          hintText: "Digite seu nome",
                          suffixIcon: Icon(Icons.perm_contact_calendar),
                          hintStyle: TextStyle(fontSize: 12)),
                    ),
                    TextFormField(
                      controller: telefoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Telefone não pode ser vazio";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Digite seu telefone",
                          focusColor: Color.fromRGBO(42, 173, 170, 1),
                          hintStyle: TextStyle(fontSize: 12),
                          suffixIcon: Icon(Icons.add_call)),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email não pode ser vazio";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Digite seu email",
                          focusColor: Color.fromRGBO(42, 173, 170, 1),
                          suffixIcon: Icon(Icons.mail_outline),
                          hintStyle: TextStyle(fontSize: 12)),
                    ),
                    TextFormField(
                      controller: senhaController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "A senha não pode ser vazia";
                        }
                        if (value.length < 8) {
                          return "A senha deve conter pelo menos 8 caracteres";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Digite sua senha",
                          focusColor: Color.fromRGBO(42, 173, 170, 1),
                          hintStyle: TextStyle(fontSize: 12),
                          suffixIcon: Icon(Icons.lock_outline)),
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: senhaConfirmController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (senhaController.text != value) {
                          return "As senhas não coincidem";
                        }
                        if (value.isEmpty) {
                          return "A senha não pode ser vazia";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Confirme sua senha",
                          focusColor: Color.fromRGBO(42, 173, 170, 1),
                          hintStyle: TextStyle(fontSize: 12),
                          suffixIcon: Icon(Icons.lock_outline)),
                      obscureText: true,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: botaoVerde("Cadastrar", () {
                          if (_formKey.currentState.validate()) {
                            _cadastrar();
                          }
                        }))
                  ],
                ),
              )),
        ),
        bottomNavigationBar: getBottonBar(context),
      );
}
