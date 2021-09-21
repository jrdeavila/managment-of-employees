import 'user.dart';

List<User> modelUsers = <User>[
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
];

User? validateUser(String username) {
  User? user;
  try {
    user = modelUsers.firstWhere((user) => user.username == username);
  } catch (e) {
    user = null;
  } finally {
    // ignore: control_flow_in_finally
    return user;
  }
}
