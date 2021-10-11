class AgendaModel {
  int idAgendamento;
  int idCliente;
  int idDistribuidor;
  String descricao;
  String dataCriaO;
  String dataAgendamento;
  int isActive;
  Cliente cliente;

  AgendaModel(
      {this.idAgendamento,
      this.idCliente,
      this.idDistribuidor,
      this.descricao,
      this.dataCriaO,
      this.dataAgendamento,
      this.isActive,
      this.cliente});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    idAgendamento = json['id_agendamento'];
    idCliente = json['id_cliente'];
    idDistribuidor = json['id_distribuidor'];
    descricao = json['descricao'];
    dataCriaO = json['data_criação'];
    dataAgendamento = json['data_agendamento'];
    isActive = json['isActive'];
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_agendamento'] = this.idAgendamento;
    data['id_cliente'] = this.idCliente;
    data['id_distribuidor'] = this.idDistribuidor;
    data['descricao'] = this.descricao;
    data['data_criação'] = this.dataCriaO;
    data['data_agendamento'] = this.dataAgendamento;
    data['isActive'] = this.isActive;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    return data;
  }
}

class Cliente {
  int idCliente;
  int idDistribuidor;
  String nome;
  String cpfCnpj;
  String rg;
  String email;
  String celular;
  String bairro;
  int cidade;
  String complementar;
  int isActive;
  String updatedAt;
  String nascimento;
  String logradouro;
  String numero;
  String uf;
  String cep;

  Cliente(
      {this.idCliente,
      this.idDistribuidor,
      this.nome,
      this.cpfCnpj,
      this.rg,
      this.email,
      this.celular,
      this.bairro,
      this.cidade,
      this.complementar,
      this.isActive,
      this.updatedAt,
      this.nascimento,
      this.logradouro,
      this.numero,
      this.uf,
      this.cep});

  Cliente.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    idDistribuidor = json['id_distribuidor'];
    nome = json['nome'];
    cpfCnpj = json['cpf_cnpj'];
    rg = json['rg'];
    email = json['email'];
    celular = json['celular'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    complementar = json['complementar'];
    isActive = json['isActive'];
    updatedAt = json['updated_at'];
    nascimento = json['nascimento'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    uf = json['uf'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_cliente'] = this.idCliente;
    data['id_distribuidor'] = this.idDistribuidor;
    data['nome'] = this.nome;
    data['cpf_cnpj'] = this.cpfCnpj;
    data['rg'] = this.rg;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['complementar'] = this.complementar;
    data['isActive'] = this.isActive;
    data['updated_at'] = this.updatedAt;
    data['nascimento'] = this.nascimento;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['uf'] = this.uf;
    data['cep'] = this.cep;
    return data;
  }
}