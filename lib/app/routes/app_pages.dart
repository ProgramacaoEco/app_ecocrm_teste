import 'package:get/get.dart';
import 'package:crm_win_app/app/modules/agendamento/bindings/agendamento_binding.dart';
import 'package:crm_win_app/app/modules/agendamento/views/agendamento_view.dart';
import 'package:crm_win_app/app/modules/clientes/bindings/clientes_binding.dart';
import 'package:crm_win_app/app/modules/clientes/views/cidades_view.dart';
import 'package:crm_win_app/app/modules/clientes/views/clientes_view.dart';
import 'package:crm_win_app/app/modules/clientes/views/novo_cliente_view.dart';
import 'package:crm_win_app/app/modules/criar_conta/bindings/criar_conta_binding.dart';
import 'package:crm_win_app/app/modules/criar_conta/views/criar_conta_view.dart';
import 'package:crm_win_app/app/modules/crm/bindings/crm_binding.dart';
import 'package:crm_win_app/app/modules/crm/views/crm_view.dart';
import 'package:crm_win_app/app/modules/login/bindings/login_binding.dart';
import 'package:crm_win_app/app/modules/login/views/login_view.dart';
import 'package:crm_win_app/app/modules/menu/bindings/menu_binding.dart';
import 'package:crm_win_app/app/modules/menu/views/menu_view.dart';
import 'package:crm_win_app/app/modules/relatorio/bindings/relatorio_binding.dart';
import 'package:crm_win_app/app/modules/relatorio/views/relatorio_view.dart';
import 'package:crm_win_app/app/modules/sair/bindings/sair_binding.dart';
import 'package:crm_win_app/app/modules/sair/views/sair_view.dart';
import 'package:crm_win_app/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:crm_win_app/app/modules/splashscreen/views/splashscreen_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTES,
      page: () => ClientesView(),
      binding: ClientesBinding(),
    ),
    GetPage(
      name: _Paths.AGENDAMENTO,
      page: () => AgendamentoView(),
      binding: AgendamentoBinding(),
    ),
    GetPage(
      name: _Paths.CRIAR_CONTA,
      page: () => CriarContaView(),
      binding: CriarContaBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SAIR,
      page: () => SairView(),
      binding: SairBinding(),
    ),
    GetPage(
      name: _Paths.RELATORIO,
      page: () => RelatorioView(),
      binding: RelatorioBinding(),
    ),
    GetPage(
      name: _Paths.CRM,
      page: () => CrmView(),
      binding: CrmBinding(),
    ),
    GetPage(
      name: _Paths.NOVOCLIENTE,
      page: () => NovoClienteView(),
      binding: ClientesBinding(),
    ),
    GetPage(
      name: _Paths.CIDADE,
      page: () => CidadesView(),
      binding: ClientesBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
