class ClickModel {
  int idDistribuidor;
  String idMaxinivel;
  String nome;
  int idProduto;
  String nomeProduto;
  int contagemClick;
  int idCliente;

  ClickModel(
      {this.idDistribuidor,
      this.idMaxinivel,
      this.nome,
      this.idProduto,
      this.nomeProduto,
      this.contagemClick,
      this.idCliente});

  ClickModel.fromJson(Map<String, dynamic> json) {
    idDistribuidor = json['id_distribuidor'];
    idMaxinivel = json['id_maxinivel'];
    nome = json['nome'];
    idProduto = json['id_produto'];
    nomeProduto = json['nome_produto'];
    contagemClick = json['contagem_click'];
    idCliente = json['id_cliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_distribuidor'] = this.idDistribuidor;
    data['id_maxinivel'] = this.idMaxinivel;
    data['nome'] = this.nome;
    data['id_produto'] = this.idProduto;
    data['nome_produto'] = this.nomeProduto;
    data['contagem_click'] = this.contagemClick;
    data['id_cliente'] = this.idCliente;
    return data;
  }
}
