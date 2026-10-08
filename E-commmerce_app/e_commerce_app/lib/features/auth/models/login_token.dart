class LoginToken {
  final String? token;

  LoginToken(this.token);

  factory LoginToken.fromJson(Map<String, dynamic> json) {
    return LoginToken(json["token"]);
  }

  Map<String, dynamic> toJson() {
    return {"token": token};
  }
}
