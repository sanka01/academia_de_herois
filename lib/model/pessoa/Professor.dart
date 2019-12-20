import 'package:academia_de_herois/model/Aula.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
//    listEquals([1,1], [1,1]);

class Professor extends Pessoa {
  List<Aula> aulas;
  int horasLivres;
  Set _horariosDisponiveis;

  Set get horariosDisponiveis => _horariosDisponiveis;

  set horariosDisponiveis(Set horariosPreferenciais) {
    _horariosDisponiveis = horariosPreferenciais;
  } // [DiaSemana, HoraInicio], periodo de 1 hora

  Set _horariosIndisponiveis;

  Set get horariosIndisponiveis => _horariosIndisponiveis;

  set horariosIndisponiveis(Set horariosIndisponiveis) {
    _horariosIndisponiveis = horariosIndisponiveis;
  } // [DiaSemana, HoraInicio], periodo de 1 hora

  Map<DateTime, DateTime> horariosIndisponiveisByData;

  List<String> anotacoes;

  @override
  String toString() {
    return nome +
        "| Horarios Indisponiveis:" +
        _horariosIndisponiveis.join(" ") +
        "| Horarios Disponiveis: " +
        horariosDisponiveis.join(" ");
  }

  Professor() {
    super.nome = "";
    horariosIndisponiveis = Set();
    horariosDisponiveis = Set();
  }

  String addHorario(int tipo, List horario) {
    if (isHorarioOcupado(horario)) {
      return "Horario já esta preenchido";
    }
    switch (tipo) {
      case 0:
        {
          horariosDisponiveis.add(horario);
          return "Horario disponivel adicionado";
        }
        break;
      case 1:
        {
          horariosIndisponiveis.add(horario);
          return "Horario Indisponivel adicionado";
        }
        break;
      case 2:
        {
          horariosIndisponiveis.add(horario);
          return "Horario Indisponivel adicionado";
        }
        break;
      case 3:
        {
          horariosIndisponiveis.add(horario);
          return "Horario Indisponivel adicionado";
        }
      default:
        return "";
    }
  }

  bool isHorarioOcupado(List horario) {
    bool status = false;
    horariosIndisponiveis.forEach((f) {
      if (horario[0] == f[0] && horario[1] == f[1]) status = true;
    });
    horariosDisponiveis.forEach((f) {
      if (horario[0] == f[0] && horario[1] == f[1]) status = true;
    });
    return status;
  }
}
