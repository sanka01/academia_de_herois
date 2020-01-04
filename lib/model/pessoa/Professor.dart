import 'package:academia_de_herois/model/Aula.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
//    listEquals([1,1], [1,1]);

class Professor extends Pessoa {
  List<Aula> aulas;
  int horasLivres;
  Map<int, int> horariosDisponiveis;// [DiaSemana, HoraInicio], periodo de 1 hora

  Map<int,int> horariosIndisponiveis;// [DiaSemana, HoraInicio], periodo de 1 hora

  Map<DateTime, DateTime> horariosIndisponiveisByData;

  List<String> anotacoes;

  Professor({
    nome,
    id,
    bio,
    usuario,
    dataCriacao,
    imagemPerfil,
    contato,
    aniversario,
    idade,
    cpf,
    email,
    endereco,
    senha,
    sexo,
    this.horariosIndisponiveis,
    this.anotacoes,
    this.aulas,
    this.horariosDisponiveis,
    this.horariosIndisponiveisByData,
    this.horasLivres
  }) : super(
    nome: nome,
    id: id,
    bio: bio,
    usuario: usuario,
    dataCriacao: dataCriacao,
    imagemPerfil: imagemPerfil,
    contato: contato,
    aniversario: aniversario,
    idade: idade,
    cpf: cpf,
    email: email,
    endereco: endereco,
    senha: senha,
    sexo: sexo,
  );


  @override
  String toString() {
    return nome;
//        +
//        "| Horarios Indisponiveis:" +
//        _horariosIndisponiveis.join(" ") +
//        "| Horarios Disponiveis: " +
//        horariosDisponiveis.join(" ");
  }

  String addHorario(int tipo, Map horario) {
//    if (isHorarioOcupado(horario)) {
//      return "Horario já esta preenchido";
//    }
    switch (tipo) {
      case 0:
        {
          horariosDisponiveis.addAll(horario);
          return "Horario disponivel adicionado";
        }
        break;
      case 1:
        {
          horariosIndisponiveis.addAll(horario);
          return "Horario Indisponivel adicionado";
        }
        break;
      case 2:
        {
          horariosIndisponiveis.addAll(horario);
          return "Horario Indisponivel adicionado";
        }
        break;
      case 3:
        {
          horariosIndisponiveis.addAll(horario);
          return "Horario Indisponivel adicionado";
        }
      default:
        return "";
    }
  }

//  bool isHorarioOcupado(List horario) {
//    bool status = false;
//    horariosIndisponiveis.forEach((f) {
//      if (horario[0] == f[0] && horario[1] == f[1]) status = true;
//    });
//    horariosDisponiveis.forEach((f) {
//      if (horario[0] == f[0] && horario[1] == f[1]) status = true;
//    });
//    return status;
//  }
}
