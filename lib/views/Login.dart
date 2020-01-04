import 'package:academia_de_herois/views/partials/partials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PaginaLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  String notice = "";
  String senha = "";
  String email = "";

  bool _logar() {
    email = emailController.text;
    senha = senhaController.text;
    if (email == "admin@admin.com" && senha == "123") {
      setState(() {
        notice = "Login bem sucedido";
      });
      return true;
    } else {
      setState(() {
        notice = "Usuario ou Senha incorretos";
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar("Login"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  )),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                ),
              ),
              Divider(),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: Text(
                          notice,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.mail_outline),
                              hintText: "Digite seu Email",
                              hintStyle: TextStyle(fontSize: 12)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor preencha o email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 50.0, right: 50.0, bottom: 15.0),
                        child: TextFormField(
                          controller: senhaController,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock_outline),
                              hintText: "Digite sua Senha",
                              hintStyle: TextStyle(fontSize: 12)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor preencha a senha';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                      botaoVerde("Entrar", () {
                        if (_formKey.currentState.validate()) {
                          if (_logar()) {
                            Navigator.pushNamed(context, '/home');
                          }
                        }
                      })
                    ],
                  )),
              Text(
                "Ainda não possui uma conta?",
                style: TextStyle(fontSize: 12),
              ),
              FlatButton(
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                      color: Color.fromRGBO(42, 173, 170, 1),
                      decoration: TextDecoration.underline,
                      fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Cadastro');
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: getBottonBar(context),
      );
}
