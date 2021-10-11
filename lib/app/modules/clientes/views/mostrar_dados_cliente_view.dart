import 'package:crm_win_app/app/models/cidadeModel.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/cidades_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/clientes/views/editar_dados_cliente_view.dart';
import 'package:crm_win_app/app/modules/crm/views/crm_view.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MostrarDadosClienteView extends GetView<ClientesController> {
  final MenuController menuController = Get.put(MenuController());
  final CidadesController navController = Get.put(CidadesController());
  final ClientesController clientController = Get.put(ClientesController());
  final InitiaValues values = Get.put(InitiaValues());

  String nome;
  String nomeDistribuidor;
  int idContato;
  String cpfcnpj;
  String nascimento;
  String logradouro;
  String numero;
  String bairro;
  CidadesModel cidade;
  String uf;
  String cep;
  String celular;
  String mail;
  String infoComplementares;

  MostrarDadosClienteView({
    @required this.nome,
    @required this.cpfcnpj,
    @required this.idContato,
    @required this.nascimento,
    @required this.logradouro,
    @required this.numero,
    @required this.bairro,
    @required this.cidade,
    @required this.uf,
    @required this.cep,
    @required this.celular,
    @required this.mail,
    @required this.infoComplementares,
    @required this.nomeDistribuidor,
  });

  @override
  Widget build(BuildContext context) {
    var nameFormated = nome.replaceAll(" ", "-");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff17b0d6),
                Color(0xff17b0d6),
                Color(0xff17b0d6),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'images/whatsapp.png',
              height: 25,
            ),
            onPressed: () async {
              var a = celular.replaceAll('-', '');
              var b = a.replaceAll('(', '');
              var celularFinal = b.replaceAll(')', '');
              var linkwhats =
                  'https://api.whatsapp.com/send?phone=55${celularFinal}';
              try {
                await launch(linkwhats);
              } catch (error) {}
            },
          ),
          IconButton(
            icon: Image.asset(
              'images/maps.png',
              height: 25,
            ),
            onPressed: () async {
              print(nomeDistribuidor);
              var linkMap =
                  'https://www.google.com/maps/search/?api=1&query=${cidade.descricao},${uf},${logradouro},${numero}';
              try {
                await launch(linkMap);
              } catch (error) {}
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_tree,
              color: Colors.amber,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CrmView(
                    idCliente: idContato,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              var nascimentoFormated = nascimento.split('-').reversed.join('/');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => EditarDadosClienteView(
                    cidade: cidade,
                    idCity: cidade.idCidade,
                    numero: numero,
                    logradouro: logradouro,
                    idContato: idContato,
                    mail: mail,
                    infoComplementares: infoComplementares,
                    cpfcnpj: cpfcnpj,
                    celular: celular,
                    cep: cep,
                    nascimento: nascimentoFormated,
                    nome: nome,
                    bairro: bairro,
                    uf: uf,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: "Nome",
                        ),
                        controller: TextEditingController(text: this.nome),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "CPF/CNPJ"),
                        controller: TextEditingController(text: this.cpfcnpj),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration:
                            InputDecoration(labelText: "Data de Nascimento"),
                        controller:
                            TextEditingController(text: this.nascimento),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "Logradouro"),
                        controller:
                            TextEditingController(text: this.logradouro),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "Número"),
                        controller: TextEditingController(text: this.numero),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "Bairro"),
                        controller: TextEditingController(text: this.bairro),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "UF"),
                        controller: TextEditingController(text: this.uf),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "Cidade"),
                        controller:
                            TextEditingController(text: this.cidade.descricao),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "Celular (DDD + número)"),
                        controller: TextEditingController(text: this.celular),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(labelText: "E-mail"),
                        controller: TextEditingController(text: this.mail),
                        enabled: false),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        keyboardType: null,
                        decoration: InputDecoration(labelText: "Link"),
                        initialValue:
                            'https://www.allinbrasil.com.br/loja/index.php?route=common/home&user_afiliate=${nomeDistribuidor}&cliente=${nameFormated}&id=${idContato}',
                        readOnly: true),
                  ),
                  IconButton(
                      icon: Icon(Icons.link),
                      onPressed: () {
                        Clipboard.setData(new ClipboardData(
                            text:
                                'https://www.allinbrasil.com.br/loja/index.php?route=common/home&user_afiliate=${nomeDistribuidor}&cliente=${nameFormated}&id=${idContato}'));
                        Get.snackbar('Sucesso', 'Link copiado com sucesso',
                            backgroundColor: Colors.green);
                      } // -> show a notification
                      ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "Informações sobre o Cliente"),
                        controller: TextEditingController(
                            text: this.infoComplementares),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: null,
                        enabled: false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
