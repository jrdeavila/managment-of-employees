import 'user.dart';

class Users {
  List<User> users = <User>[];
  Users() {
    users.addAll([
      User(
        username: "jrdeavila",
        password: "1234",
        name: "Jose Ricardo",
        lastName: "De avila Moreno",
      ),
      User(
        username: "jose.deavila15",
        password: "1234",
        name: "Ricardo",
        lastName: "Moreno",
      )
    ]);
  }
  void add(User user) => users.add(user);

  User? validateUser(String username, String password) {
    try{
 return users.firstWhere(
      (user) => user.username == username && user.password == password)
    }
    catch(){
      
    }
  }
}


void main() {
  var u = Users();
  var res = u.validateUser("jose.deavila15", "123");
  print(res.toString());
}
