import 'dart:convert';

class UserDetailsModel {
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
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  String? hireable;
  String? bio;
  String? twitter_username;
  int? public_repos;
  int? public_gists;
  int? followers;
  int? following;
  String? created_at;
  String? updated_at;

  UserDetailsModel({
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
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitter_username,
    this.public_repos,
    this.public_gists,
    this.followers,
    this.following,
    this.created_at,
    this.updated_at,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
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
      name: json["name"] != null ? json["name"] : "",
      company: json["company"] != null ? json["company"] : "",
      blog: json["blog"] != null ? json["blog"] : "",
      location: json["location"] != null ? json["location"] : "",
      email: json["email"] != null ? json["email"] : "",
      hireable: json["hireable"] != null ? json["hireable"] : "",
      bio: json["bio"] != null ? json["bio"] : "",
      twitter_username: json["twitter_username"] != null ? json["twitter_username"] : "",
      public_repos: json["public_repos"] != null ? json["public_repos"] : 0,
      public_gists: json["public_gists"] != null ? json["public_gists"] : 0,
      followers: json["followers"] != null ? json["followers"] : 0,
      following: json["following"] != null ? json["following"] : 0,
      created_at: json["created_at"] != null ? json["created_at"] : null,
      updated_at: json["updated_at"] != null ? json["updated_at"] : null,
    );
  }

  static Map<String, dynamic> toJson(UserDetailsModel? usersModel) => {
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
    'name': usersModel.name,
    'company': usersModel.company,
    'blog': usersModel.blog,
    'location': usersModel.location,
    'email': usersModel.email,
    'hireable': usersModel.hireable,
    'bio': usersModel.bio,
    'twitter_username': usersModel.twitter_username,
    'public_repos': usersModel.public_repos,
    'public_gists': usersModel.public_gists,
    'followers': usersModel.followers,
    'following': usersModel.following,
    'created_at': usersModel.created_at,
    'updated_at': usersModel.updated_at,
  };

  static String encode(List<UserDetailsModel>? usersModel) => json.encode(
    usersModel!
        .map<Map<String, dynamic>>((res) => UserDetailsModel.toJson(res))
        .toList(),
  );

  static List<UserDetailsModel> decode(String? user) =>
      (json.decode(user!) as List<dynamic>)
          .map<UserDetailsModel>((item) => UserDetailsModel.fromJson(item))
          .toList();
}