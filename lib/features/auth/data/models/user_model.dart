class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? username;

  UserModel({this.email, this.username, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    print(json['email']);
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "username": username,
    };
  }
}
