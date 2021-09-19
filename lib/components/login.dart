import "package:flutter/material.dart";
import 'package:rna_learning/screens/employees_screen.dart';
import "input.dart";
import "package:rna_learning/models/users.dart";

class Login extends StatefulWidget {
  var users = Users();
  @override
  _LoginState createState() => _LoginState(users);
}

class _LoginState extends State<Login> {
  Users users;
  final _usrController = TextEditingController();
  final _passController = TextEditingController();
  bool logged = false;

  _LoginState(this.users);

  void validate() {
    var user = users.validateUser(_usrController.text, _passController.text);
    if (user != null) {
      setState(() {
        logged = true;
      });
    }
    redirectEmployees();
  }

  void redirectEmployees() {
    if (logged == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EmployeesPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputText(placeholder: "Username", controller: _usrController
                    // textInputType: TextInputType.number,
                    ),
                const SizedBox(height: 10),
                InputText(
                    placeholder: "Password",
                    secret: true,
                    controller: _passController
                    // textInputType: TextInputType.number,
                    ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      validate();
                    },
                    child: const SizedBox(
                        width: double.infinity, child: Text("Entry"))),
              ],
            )));
  }
}
