import 'package:academia_de_herois/model/Pacote.dart';
import 'package:academia_de_herois/model/Util.dart';
import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Professor.dart';

class Aula{
  DateTime horaInicio;
  DateTime horaFim;
  Pacote pacote;
  Aluno aluno;
  Professor professor;
  int materia;
  int situacao;

  String situacaoNome() => Util.situacoes[situacao];
  String materiaNome() => Util.materias[materia];

}