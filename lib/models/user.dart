class User {
  String username, password, name, lastName;

  String? photoUrl;

  User(
      {this.username = '',
      this.password = '',
      this.name = '',
      this.lastName = '',
      this.photoUrl});
}
