import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/components/main/main_module.dart';
import 'package:profileusergithub/components/user_details/user_details_module.dart';
import 'package:profileusergithub/services/main_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $MainService
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: MainModule(),
    ),
    ModuleRoute(
      '/user-details/',
      module: UserDetailModule(),
    ),
  ];
}
