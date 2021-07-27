import 'dart:convert';

class UsersModel {
  String? login;
  int? id;
  String? node_id;
  String? avatar_url;
  String? gravatar_id;
  String? url;
  String? html_url;
  String? followers_url;
  String? following_url;
  String? gists_url;
  String? starred_url;
  String? subscriptions_url;
  String? organizations_url;
  String? repos_url;
  String? events_url;
  String? received_events_url;
  String? type;
  bool? site_admin;

  UsersModel({
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.events_url,
    this.received_events_url,
    this.type,
    this.site_admin,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      login: json["login"] != null ? json["login"] : '',
      id: json["id"] != null ? json["id"] : 0,
      node_id: json["node_id"] != null ? json["node_id"] : '',
      avatar_url: json["avatar_url"] != null ? json["avatar_url"] : "",
      gravatar_id: json["gravatar_id"] != null ? json["gravatar_id"] : "",
      url: json["url"] != null ? json["url"] : "",
      html_url: json["html_url"] != null ? json["html_url"] : "",
      followers_url: json["followers_url"] != null ? json["followers_url"] : '',
      following_url: json["following_url"] != null ? json["following_url"] : "",
      gists_url: json["gists_url"] != null ? json["gists_url"] : '',
      starred_url: json["starred_url"] != null ? json["starred_url"] : '',
      subscriptions_url:
          json["subscriptions_url"] != null ? json["subscriptions_url"] : "",
      organizations_url:
          json["organizations_url"] != null ? json["organizations_url"] : "",
      repos_url: json["repos_url"] != null ? json["repos_url"] : "",
      events_url: json["events_url"] != null ? json["events_url"] : "",
      received_events_url: json["received_events_url"] != null
          ? json["received_events_url"]
          : "",
      type: json["type"] != null ? json["type"] : "",
      site_admin: json["site_admin"] != null ? json["site_admin"] : "",
    );
  }

  static Map<String, dynamic> toJson(UsersModel? usersModel) => {
        'login': usersModel!.login,
        'id': usersModel.id,
        'node_id': usersModel.node_id,
        'avatar_url': usersModel.avatar_url,
        'gravatar_id': usersModel.gravatar_id,
        'url': usersModel.url,
        'html_url': usersModel.html_url,
        'followers_url': usersModel.followers_url,
        'following_url': usersModel.following_url,
        'gists_url': usersModel.gists_url,
        'starred_url': usersModel.starred_url,
        'subscriptions_url': usersModel.subscriptions_url,
        'organizations_url': usersModel.organizations_url,
        'repos_url': usersModel.repos_url,
        'events_url': usersModel.events_url,
        'received_events_url': usersModel.received_events_url,
        'type': usersModel.type,
        'site_admin': usersModel.site_admin,
      };

  static String encode(List<UsersModel>? usersModel) => json.encode(
        usersModel!
            .map<Map<String, dynamic>>((res) => UsersModel.toJson(res))
            .toList(),
      );

  static List<UsersModel> decode(String? user) =>
      (json.decode(user!) as List<dynamic>)
          .map<UsersModel>((item) => UsersModel.fromJson(item))
          .toList();
}
