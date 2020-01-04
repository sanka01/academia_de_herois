import 'dart:convert';

import 'package:academia_de_herois/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Pessoa {
  int id;
  String nome;
  String usuario;
  String senha;
  int idade;
  DateTime aniversario;
  String sexo;
  String cpf;
  String contato;
  String email;
  String imagemPerfil;
  String bio;
  _Endereco endereco;

  DateTime dataCriacao;

  @override
  toString() {
    return this.nome;
  }

  Pessoa.login(this.email, this.senha);

  Pessoa({
    this.nome,
    this.id,
    this.bio,
    this.usuario,
    this.dataCriacao,
    this.imagemPerfil,
    this.contato,
    this.aniversario,
    this.idade,
    this.cpf,
    this.email,
    this.endereco,
    this.senha,
    this.sexo,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    debugPrint("Tentando criar nova Pessoa");
    Pessoa pessoa = Pessoa(
      nome: json['nome'],
      id: int.parse(json['id']),
    );

    debugPrint("Nova pessoa: " + pessoa.toString());
    return pessoa;
  }

  Pessoa.novoUsuario(this.nome, this.contato, this.email, this.senha);

  bool salvar(Pessoa pessoa) {
    usuarios.add(pessoa);
    return true;
  }
}

class _Endereco {
  String cep;
  String rua;
  String quadra;
  String lote;
  String referencias;
  String cidade;
  String estado;
}
