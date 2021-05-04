class User {
  String username;
  String email;
  String address;
  String mobile;
  String password;

  User(this.username, this.email, this.address, this.mobile);

  User.fromJson(parsedJson) {
    username = parsedJson['name'];
    email = parsedJson['email'];
    address = parsedJson['address'];
    mobile = parsedJson['mobile'];
    password = parsedJson['password'];
  }
}
