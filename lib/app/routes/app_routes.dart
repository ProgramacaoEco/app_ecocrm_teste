part of 'app_pages.dart';
abstract class Routes {
  Routes._();

  static const MENU = _Paths.MENU;
  static const AGENDA = _Paths.AGENDA;
  static const CLIENTES = _Paths.CLIENTES;
  static const AGENDAMENTO = _Paths.AGENDAMENTO;
  static const CRIAR_CONTA = _Paths.CRIAR_CONTA;
  static const LOGIN = _Paths.LOGIN;
  static const SAIR = _Paths.SAIR;
  static const RELATORIO = _Paths.RELATORIO;
  static const CRM = _Paths.CRM;
  static const NOVOCLIENTE = _Paths.NOVOCLIENTE;
  static const CIDADE = _Paths.CIDADE;
  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
}

abstract class _Paths {
  static const MENU = '/menu';
  static const AGENDA = '/agenda';
  static const CLIENTES = '/clientes';
  static const AGENDAMENTO = '/agendamento';
  static const CRIAR_CONTA = '/criar-conta';
  static const LOGIN = '/login';
  static const SAIR = '/sair';
  static const RELATORIO = '/relatorio';
  static const CRM = '/crm';
  static const NOVOCLIENTE = '/novocliente';
  static const CIDADE = '/cidades';
  static const SPLASHSCREEN = '/splashscreen';
}
