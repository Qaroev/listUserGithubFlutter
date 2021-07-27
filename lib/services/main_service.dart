import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/models/user_details_model.dart';
import 'package:profileusergithub/models/user_model.dart';
import 'package:http/http.dart' as http;

part 'main_service.g.dart';

@Injectable()
class MainService extends Disposable {
  Future<List<UsersModel>> getUserGitHub() async {
    var res = await http.get(Uri.parse('https://api.github.com/users'));
    if (res.statusCode == 200 || res.statusCode == 400) {
      var list = jsonDecode(res.body) as List;
      List<UsersModel> users = list.map((i) => UsersModel.fromJson(i)).toList();
      return users;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<UserDetailsModel> getDetailsUser(String? login) async {
    var res = await http.get(Uri.parse('https://api.github.com/users/$login'));
    if (res.statusCode == 200 || res.statusCode == 400) {
      UserDetailsModel userDetails =
          UserDetailsModel.fromJson(jsonDecode(res.body));
      return userDetails;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  @override
  void dispose() {}
}
