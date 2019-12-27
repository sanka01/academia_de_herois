class Pessoa {
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


  Pessoa(this.nome, [this.id, this.usuario, this.senha, this.idade,
      this.aniversario, this.sexo, this.cpf, this.contato, this.email, this.bio,
      this.endereco, this.dataCriacao]);

  Pessoa.novoUsuario(this.nome, this.contato, this.email, this.senha);

  bool salvar(){
    return true;
  }
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
