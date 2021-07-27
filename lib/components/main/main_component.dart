import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/models/user_model.dart';
import 'package:profileusergithub/services/localstorage_service.dart';
import 'package:profileusergithub/services/main_service.dart';

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  MainService _mainService = Modular.get<MainService>();
  LocalStorageService _localStorageService = new LocalStorageService();
  List<UsersModel>? usersGitHub;

  @override
  void initState() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        getUserData();
      } else {
        _localStorageService.getData('usersData').then((value) {
          var users = UsersModel.decode(value);
          setState(() => usersGitHub = users);
        });
      }
    });

    super.initState();
  }

  getUserData() {
    _mainService.getUserGitHub().then((users) async {
      setState(() => usersGitHub = users);
      var userData = await _localStorageService.getData('usersData');
      if (userData == null) {
        _localStorageService.saveData('usersData', UsersModel.encode(users));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Users'),
      ),
      body: usersGitHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  Duration(seconds: 1),
                  () {
                    getUserData();
                  },
                );
              },
              child: ListView.builder(
                  itemCount: usersGitHub!.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () => Modular.to
                          .pushNamed('/user-details/${usersGitHub![i].login}'),
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 80,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(usersGitHub![i].avatar_url!),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(usersGitHub![i].login!,
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 12),
                                    Text(
                                      usersGitHub![i].id!.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
