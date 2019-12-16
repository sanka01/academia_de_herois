import 'package:academia_de_herois/model/Aula.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
import 'package:flutter/foundation.dart';

class Professor extends Pessoa{
  List<Aula> aulas;
  int horasLivres;
  Set horariosPreferenciais;  // [DiaSemana, HoraInicio], periodo de 1 hora
  Set horariosIndisponiveis;  // [DiaSemana, HoraInicio], periodo de 1 hora
  List<String> anotacoes;


  Professor(){
   super.nome = "";
  }

  void addHorarioIndisponivel(int dia, int horaInicio, int horaFinal){
      horariosIndisponiveis.add([dia,horaInicio,horaFinal]);
      print(listEquals([1,1], [1,1]));

  }

}