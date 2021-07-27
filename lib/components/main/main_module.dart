import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/components/main/main_component.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainComponent()),
  ];
}
