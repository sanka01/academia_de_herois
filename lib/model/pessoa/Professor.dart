import 'package:academia_de_herois/model/Aula.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';

class Professor extends Pessoa{
  List<Aula> aulas;
  int horasLivres;
  List<DateTime> horariosPreferenciais;
  List<String> anotacoes;
}