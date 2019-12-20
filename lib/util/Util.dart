import 'package:academia_de_herois/model/pessoa/Professor.dart';

Map<int, String> get situacoes =>
    {1: "Finalizada", 2: "Estudante Ausente", 3: "Remarcada"};

Map<int, String> get materias => {
      0: "Tarefas/Provas",
      1: "Matemática",
      2: "Português",
      3: "História",
      4: "Geografia",
      5: "Inglês",
      6: "Espanhol",
      7: "Ciências",
      8: "Química",
      9: "Biologia",
      10: "Física",
      11: "Filosofia",
      12: "Sociologia",
      13: "Literatura",
      14: "Artes",
      15: "Ed. Física",
      16: "Lógica",
      17: "Redação"
    };

Map<String, int> horas = {
  "06:00 - 07:00": 6,
  "07:00 - 08:00": 7,
  "08:00 - 09:00": 8,
  "09:00 - 10:00": 9,
  "10:00 - 11:00": 10,
  "11:00 - 12:00": 11,
  "12:00 - 13:00": 12,
  "13:00 - 14:00": 13,
  "14:00 - 15:00": 14,
  "15:00 - 16:00": 15,
  "16:00 - 17:00": 16,
  "17:00 - 18:00": 17,
  "18:00 - 19:00": 18,
  "19:00 - 20:00": 19,
  "20:00 - 21:00": 20,
  "21:00 - 22:00": 21,
  "22:00 - 23:00": 22
};
Map<String, int> diasSemana = {
  "Domingo": 0,
  "Segunda-Feira": 1,
  "Terça-Feira": 2,
  "Quarta-Feira": 3,
  "Quinta-Feira": 4,
  "Sexta-Feira": 5,
  "Sabado": 6
};
Map<String, int> tipos = {
  "Livre": 0,
  "Indisponivel": 1,
  "Ocupado": 2,
  "Aluno": 3
};

Professor usuario;

List<Professor> professores = [
  Professor({[1,13],[1,14],[1,15],[1,16]}, "João"),
  Professor({}, "Amanda"),
  Professor({[6,8],[6,9]}, "Daniel")
];

//  Professor(this._horariosDisponiveis, this._horariosIndisponiveis, String nome)
