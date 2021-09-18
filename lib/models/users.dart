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
    User? user;
    try {
      user = users.firstWhere(
          (user) => user.username == username && user.password == password);
    } catch (e) {
      user = null;
    } finally {
      // ignore: control_flow_in_finally
      return user;
    }
  }
}
