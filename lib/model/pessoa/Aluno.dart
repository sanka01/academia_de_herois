import 'package:academia_de_herois/model/Pacote.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';
import 'package:academia_de_herois/model/pessoa/Responsavel.dart';

class Aluno extends Pessoa {
  Responsavel responsavel;
  List<Pacote> pacotesComprados;
  String escola;
  List<String> dificuldades;
  String ano;
  DateTime periodoEstudo;

  Aluno({
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
}
