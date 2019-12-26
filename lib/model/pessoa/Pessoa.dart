abstract class Pessoa {
  int id;
  String nome;
  String usuario;
  String senha;
  int idade;
  DateTime aniversario;
  String sexo;
  String cpf;
  String contato;
  String email;
  String bio;
  _Endereco endereco;

  DateTime dataCriacao;


  Pessoa.login(this.email, this.senha);

  Pessoa(this.nome);

  Pessoa.novoUsuario(this.nome, this.contato, this.email, this.senha);
}

class _Endereco {
  String cep;
  String rua;
  String quadra;
  String lote;
  String referencias;
  String cidade;
  String estado;
}
