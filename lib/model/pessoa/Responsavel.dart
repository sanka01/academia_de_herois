import 'package:academia_de_herois/model/pessoa/Aluno.dart';
import 'package:academia_de_herois/model/pessoa/Pessoa.dart';

class Responsavel extends Pessoa {
  List<Aluno> alunos;

  Responsavel({
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
