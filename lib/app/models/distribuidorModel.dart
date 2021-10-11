class Distribuidor {
  int idDistribuidor;
  String idMaxinivel;
  int idCidade;
  String bairro;
  String nome;
  String cnpjCpf;
  Null rg;
  String email;
  String celular;
  Null complementar;
  String nomeFantasia;
  String razaoSocial;
  String ie;
  String logradouro;
  String numero;
  String cep;
  String uf;
  int isActive;
  String updatedAt;
  String createdAt;

  Distribuidor(
      {this.idDistribuidor,
      this.idMaxinivel,
      this.idCidade,
      this.bairro,
      this.nome,
      this.cnpjCpf,
      this.rg,
      this.email,
      this.celular,
      this.complementar,
      this.nomeFantasia,
      this.razaoSocial,
      this.ie,
      this.logradouro,
      this.numero,
      this.cep,
      this.uf,
      this.isActive,
      this.updatedAt,
      this.createdAt});

  Distribuidor.fromJson(Map<String, dynamic> json) {
    idDistribuidor = json['id_distribuidor'];
    idMaxinivel = json['id_maxinivel'];
    idCidade = json['id_cidade'];
    bairro = json['bairro'];
    nome = json['nome'];
    cnpjCpf = json['cnpj_cpf'];
    rg = json['rg'];
    email = json['email'];
    celular = json['celular'];
    complementar = json['complementar'];
    nomeFantasia = json['nome_fantasia'];
    razaoSocial = json['razao_social'];
    ie = json['ie'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    cep = json['cep'];
    uf = json['uf'];
    isActive = json['isActive'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_distribuidor'] = this.idDistribuidor;
    data['id_maxinivel'] = this.idMaxinivel;
    data['id_cidade'] = this.idCidade;
    data['bairro'] = this.bairro;
    data['nome'] = this.nome;
    data['cnpj_cpf'] = this.cnpjCpf;
    data['rg'] = this.rg;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['complementar'] = this.complementar;
    data['nome_fantasia'] = this.nomeFantasia;
    data['razao_social'] = this.razaoSocial;
    data['ie'] = this.ie;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['cep'] = this.cep;
    data['uf'] = this.uf;
    data['isActive'] = this.isActive;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}