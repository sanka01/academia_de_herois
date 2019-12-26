import 'package:academia_de_herois/model/Pacote.dart';
import 'package:academia_de_herois/util/Util.dart';
import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Professor.dart';
import 'package:flutter/material.dart';

class Aula{

  DateTime dia;
  TimeOfDay horaInicio;
  TimeOfDay horaFim;
  Pacote pacote;
  Aluno aluno;
  Professor professor;
  int materia;
  int situacao;
  String conteudo;

  String situacaoNome() => situacoes[situacao];
  String materiaNome() => materias[materia];

}