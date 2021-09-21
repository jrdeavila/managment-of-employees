import 'user.dart';

List<User> modelUsers = <User>[
  User(
      username: "jrdeavila",
      password: "1234",
      name: "Jose Ricardo",
      lastName: "De avila Moreno",
      photoUrl:
          "https://scontent.fctg1-3.fna.fbcdn.net/v/t39.30808-6/173963509_4165925000161621_328806517991861306_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=94337LEOAuUAX86MTU5&_nc_ht=scontent.fctg1-3.fna&oh=fbf3242a4da49f6b6badfc0af8641d02&oe=614EABC3"),
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
