import "package:flutter/material.dart";
import "input.dart";
import "package:rna_learning/models/users.dart";



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usrController = TextEditingController();
  final _passController = TextEditingController();
  bool logged = false;
  void validate() {
    print(_usrController.text);
    print(_passController.text);
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
