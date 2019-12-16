abstract class Pessoa{
  String nome;
  int idade;
  DateTime aniversario;
  String cpf;
  String contato;

  Pessoa(){
    nome = "";
    idade = 0;
    aniversario = DateTime.now();
    cpf = "";
    contato = "";
  }

}