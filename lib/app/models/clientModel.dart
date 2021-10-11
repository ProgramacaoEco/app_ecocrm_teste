import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:crm_win_app/app/models/distribuidorModel.dart';

class ClientModel {
  int idCliente;
  int idDistribuidor;
  String nome;
  String cpfCnpj;
  String rg;
  String email;
  String celular;
  String bairro;
  CidadesModel cidade;
  String complementar;
  int isActive;
  String updatedAt;
  String nascimento;
  String logradouro;
  String numero;
  String uf;
  String cep;
  Distribuidor distribuidor;

  ClientModel(
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
      this.cep,
      this.distribuidor});

  ClientModel.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    idDistribuidor = json['id_distribuidor'];
    nome = json['nome'];
    cpfCnpj = json['cpf_cnpj'];
    rg = json['rg'];
    email = json['email'];
    celular = json['celular'];
    bairro = json['bairro'];
    cidade = json['cidade'] != null
        ? new CidadesModel.fromJson(json['cidade'])
        : null;
    complementar = json['complementar'];
    isActive = json['isActive'];
    updatedAt = json['updated_at'];
    nascimento = json['nascimento'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    uf = json['uf'];
    cep = json['cep'];
    distribuidor = json['distribuidor'] != null
        ? new Distribuidor.fromJson(json['distribuidor'])
        : null;
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
    if (this.cidade != null) {
      data['cidade'] = this.cidade.toJson();
    }
    data['complementar'] = this.complementar;
    data['isActive'] = this.isActive;
    data['updated_at'] = this.updatedAt;
    data['nascimento'] = this.nascimento;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['uf'] = this.uf;
    data['cep'] = this.cep;
    if (this.distribuidor != null) {
      data['distribuidor'] = this.distribuidor.toJson();
    }
    return data;
  }
}
