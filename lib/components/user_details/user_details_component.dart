import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:profileusergithub/models/user_details_model.dart';
import 'package:profileusergithub/services/main_service.dart';

class UserDetailsComponent extends StatefulWidget {
  final String? login;

  UserDetailsComponent({Key? key, this.login}) : super(key: key);

  @override
  _UserDetailsComponentState createState() => _UserDetailsComponentState();
}

class _UserDetailsComponentState extends State<UserDetailsComponent> {
  MainService _mainService = Modular.get<MainService>();
  UserDetailsModel? userDetails;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  getUserDetails() {
    _mainService.getDetailsUser(widget.login!).then((value) {
      setState(() => userDetails = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details ${widget.login}'),
      ),
      body: userDetails != null
          ? Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userDetails!.avatar_url!),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Name: '), Text('${userDetails!.name}')],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Organization: '),
                      Expanded(child: Text('${userDetails!.organizations_url}'))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Following count: '),
                      Text('${userDetails!.following}')
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Followers count: '),
                      Text('${userDetails!.followers}')
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Followers count: '),
                      Text('${getTime(userDetails!.created_at)}')
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  String getTime(String? time) {
    var date = DateTime.parse(time!);
    return '${date.day}/${date.month}/${date.year}';
  }
}
