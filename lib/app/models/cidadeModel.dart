class CidadesModel {
  int idCidade;
  String descricao;
  String uf;
  int codigoIbge;
  String ddd;

  CidadesModel(
      {this.idCidade, this.descricao, this.uf, this.codigoIbge, this.ddd});

  CidadesModel.fromJson(Map<String, dynamic> json) {
    idCidade = json['id_cidade'];
    descricao = json['descricao'];
    uf = json['uf'];
    codigoIbge = json['codigo_ibge'];
    ddd = json['ddd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_cidade'] = this.idCidade;
    data['descricao'] = this.descricao;
    data['uf'] = this.uf;
    data['codigo_ibge'] = this.codigoIbge;
    data['ddd'] = this.ddd;
    return data;
  }
}
