import 'package:crm_win_app/app/modules/agendamento/controllers/agendamento_controller.dart';
import 'package:crm_win_app/app/modules/agendamento/views/agendamento_view.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/clientes_controller.dart';
import 'package:crm_win_app/app/modules/clientes/controllers/initialValues_controller.dart';
import 'package:crm_win_app/app/modules/clientes/views/clientes_view.dart';
import 'package:crm_win_app/app/modules/login/controllers/login_controller.dart';
import 'package:crm_win_app/app/modules/relatorio/views/relatorio_view.dart';
import 'package:crm_win_app/app/modules/sair/views/sair_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  final LoginController auth = Get.put(LoginController());
  final AgendamentoController agendamentoController =
      Get.put(AgendamentoController());
  final AgendamentoController agendamentosController =
      Get.put(AgendamentoController());
  final MenuController menuController = Get.put(MenuController());
  final ClientesController clientController = Get.put(ClientesController());
  final InitiaValues values = Get.put(InitiaValues());

  final List<Widget> telas = [
    ClientesView(),
    AgendamentoView(),
    RelatorioView(),
    SairView()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(
          () => Center(
            child: telas.elementAt(controller.selectedIndex),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomAppBar(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                    Color(0xff17b0d6),
                  ],
                ),
              ),
              height: 60,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.supervised_user_circle_outlined,
                        color: Colors.white),
                    label: "Cliente",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined,
                        color: Colors.white),
                    label: "Agenda",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_tree, color: Colors.white),
                    label: "Crm",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: "Sair",
                  ),
                ],
                currentIndex: controller.selectedIndex,
                onTap: (index) => controller.selectedIndex = index,
                fixedColor: Colors.white,
                unselectedItemColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
