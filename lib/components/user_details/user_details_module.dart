import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/components/user_details/user_details_component.dart';

class UserDetailModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id',
        child: (_, args) => UserDetailsComponent(
              login: args.params['id'] != null ? args.params['id'] : null,
            )),
  ];
}
