
class User {

  String _id;
  String login;
  String password;
  int coins;
  String firstname;
  String lastname;
  bool admin;

  User(this._id, this.login, this.password, this.coins, this.firstname,
      this.lastname, this.admin);

  factory User.fromJson(dynamic json) {
    return User(json["_id"], json["login"], json["password"], json["coins"], json["firstname"], json["lastname"], json["admin"]);
  }
}