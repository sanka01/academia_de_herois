import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';

class Responsavel extends Pessoa{
  List<Aluno> alunos;

  Responsavel(String nome) : super(nome: nome);

}