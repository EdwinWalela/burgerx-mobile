class User {
  String username;
  String email;
  String address;
  String mobile;
  String password;
  String token;

  User({this.username, this.email, this.address, this.mobile, this.password});

  User.fromJson(parsedJson) {
    username = parsedJson['name'];
    email = parsedJson['email'];
    address = parsedJson['address'];
    mobile = parsedJson['mobile'];
    password = parsedJson['password'];
  }

  Map<String, String> toMap() {
    return <String, String>{
      "username": username,
      "email": email,
      "address": address,
      "mobile": mobile,
    };
  }
}
