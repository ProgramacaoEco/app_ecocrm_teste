import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/clientes/views/mostrar_dados_cliente_view.dart';
import 'package:crm_win_app/app/modules/clientes/views/novo_cliente_view.dart';
import 'package:crm_win_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:crm_win_app/app/modules/sair/controllers/sair_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/clientes_controller.dart';

class ClientesView extends GetView<ClientesController> {
  final ClientesController controller = Get.put(ClientesController());
  final MenuController menuController = Get.put(MenuController());
  final AgendamentoController agendamentocontroller =
      Get.put(AgendamentoController());
  final SairController sairController = Get.put(SairController());

  TextEditingController textFieldController = TextEditingController();
  TextEditingController nomeDistribuidor = TextEditingController();
  TextEditingController nomeFilter = TextEditingController();

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Clientes'),
    Tab(text: 'Aniversariantes'),
    Tab(text: 'Pesquisar'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                  ],
                ),
              ),
            ),
            title: Text('Clientes', style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Get.to(() => NovoClienteView());
                },
              ),
              IconButton(
                onPressed: () {
                  return showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Ajuda'),
                      content: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          children: [
                            Text(
                              'Clique no icone de + para criar um novo cliente. \n\nObs. Caso após você cadastrar o cliente e ele nao aparecer, faça o movimento conforme imagem abaixo na sua lista de clientes para atualiza!',
                              textAlign: TextAlign.justify,
                            ),
                            Text(''),
                            Image.asset(
                              'images/image.png',
                              scale: 5,
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                          child: const Text('Voltar'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.amber,
              tabs: [
                Tab(
                  text: 'Geral',
                ),
                Tab(
                  text: 'Aniversariantes',
                ),
                Tab(
                  text: 'Pesquisar',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Obx(
                () => RefreshIndicator(
                  onRefresh: () => controller.getAllClients(),
                  child: ListView.builder(
                    itemCount: controller.clientes.length,
                    itemBuilder: (context, index) {
                      final v = controller.clientes[index];
                      var nascimentoFormated =
                          v.nascimento.split('-').reversed.join('/');
                      return ListTile(
                        title: Text('${v.nome.toString()}'),
                        subtitle: Text('${v.cpfCnpj.toString()}'),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MostrarDadosClienteView(
                                logradouro: v.logradouro,
                                cidade: v.cidade,
                                numero: v.numero,
                                cep: v.cep,
                                nascimento: nascimentoFormated,
                                uf: v.uf,
                                bairro: v.bairro,
                                nome: v.nome,
                                celular: v.celular,
                                cpfcnpj: v.cpfCnpj,
                                infoComplementares: v.complementar,
                                idContato: v.idCliente,
                                mail: v.email,
                                nomeDistribuidor:
                                    controller.distribuidor[index].idMaxinivel,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Obx(
                () => RefreshIndicator(
                  onRefresh: () => controller.getAllBirthday(),
                  child: ListView.builder(
                    itemCount: controller.aniversariantes.length,
                    itemBuilder: (context, index) {
                      final v = controller.aniversariantes[index];
                      var nascimentoFormated =
                          v.nascimento.split('-').reversed.join('/');
                      return ListTile(
                        title: Text('${v.nome.toString()}'),
                        subtitle: Text('${v.cpfCnpj.toString()}'),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MostrarDadosClienteView(
                                cidade: v.cidade,
                                logradouro: v.logradouro,
                                numero: v.numero,
                                cep: v.cep,
                                nascimento: nascimentoFormated,
                                uf: v.uf,
                                bairro: v.bairro,
                                nome: v.nome,
                                celular: v.celular,
                                cpfcnpj: v.cpfCnpj,
                                infoComplementares: v.complementar,
                                idContato: v.idCliente,
                                mail: v.email,
                                nomeDistribuidor:
                                    controller.distribuidor[index].idMaxinivel,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          /*  suffixIcon: IconButton(
                              onPressed: () {
                                
                              },
                              icon: Icon(Icons.search)), */
                          hintText: 'Digite para pesquisar',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        onChanged: (value) {
                          nomeFilter.text = value;
                          controller.filterByName(nomeFilter.text);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.filterCliente.length,
                        itemBuilder: (context, index) {
                          final v = controller.filterCliente[index];
                          var nascimentoFormated =
                              v.nascimento.split('-').reversed.join('/');
                          return ListTile(
                            title: Text(v.nome.toString()),
                            subtitle: Text(v.cpfCnpj.toString()),
                            onTap: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => MostrarDadosClienteView(
                                    cidade: v.cidade,
                                    logradouro: v.logradouro,
                                    numero: v.numero,
                                    cep: v.cep,
                                    nascimento: nascimentoFormated,
                                    uf: v.uf,
                                    bairro: v.bairro,
                                    nome: v.nome,
                                    celular: v.celular,
                                    cpfcnpj: v.cpfCnpj,
                                    infoComplementares: v.complementar,
                                    idContato: v.idCliente,
                                    mail: v.email,
                                    nomeDistribuidor: controller
                                        .distribuidor[index].idMaxinivel,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
