import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:rna_learning/components/alert.dart';
import 'package:rna_learning/components/card_employee.dart';
import 'package:rna_learning/models/employee.dart';
import 'package:rna_learning/models/employees.dart';
import 'package:rna_learning/screens/create_employee_screen.dart';
import 'package:rna_learning/globals.dart' as globals;

// ignore: must_be_immutable
AlertDialog alertConfirmDismiss(context) => AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to detele this employee"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("DELETE"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ]);

// ignore: must_be_immutable
class EmployeesPage extends StatefulWidget {
  List<Employee> employees = <Employee>[];
  EmployeesPage({Key? key}) : super(key: key) {
    employees = modelEmployees;
  }
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

// ignore: must_be_immutable
class ListEmployees extends StatefulWidget {
  List<Employee> employees;
  ListEmployees(this.employees, {Key? key}) : super(key: key);
  @override
  _ListEmployeesState createState() => _ListEmployeesState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Employees"),
            Row(
              children: [
                Text(globals.name ?? 'user',
                    style: const TextStyle(color: Colors.pink, fontSize: 14)),
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                    backgroundImage: NetworkImage(globals.photoUrl), radius: 15)
              ],
            )
          ],
        ),
      ),
      body: ListEmployees(widget.employees),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateEmployeePage()))
              .then((value) => setState(() {
                    if (value == true) {
                      alert(
                        context,
                        message: "Employee updated successfully",
                        color: Colors.green,
                        duration: 2,
                      );
                    }
                  }));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class _ListEmployeesState extends State<ListEmployees> {
  var listEmployees = <Employee>[];
  String _filter = "";
  _ListEmployeesState() {
    listEmployees = modelEmployees;
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          decoration: const InputDecoration(
            labelText: "Find employees",
          ),
          onChanged: (text) {
            setState(() {
              _filter = text;
              listEmployees = filterByString(_filter);
            });
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: listEmployees.length,
            itemBuilder: (context, index) {
              final crtEmp = listEmployees[index];
              return GestureDetector(
                  onTap: () async {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateEmployeePage(employee: crtEmp)))
                        .then((value) => setState(() {
                              if (value == true) {
                                alert(
                                  context,
                                  message: "Employee updated successfully",
                                  color: Colors.green,
                                  duration: 2,
                                );
                              }
                            }));
                  },
                  child: Dismissible(
                    key: Key(crtEmp.name),
                    child: CardEmployee(crtEmp),
                    direction: DismissDirection.startToEnd,
                    dragStartBehavior: DragStartBehavior.start,
                    resizeDuration: const Duration(milliseconds: 500),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertConfirmDismiss(context);
                          });
                    },
                    onDismissed: (direction) {
                      setState(() {
                        widget.employees.removeAt(index);
                      });
                      alert(context,
                          message: "Employee ${crtEmp.name} has been deleted");
                    },
                    background: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20.0),
                        color: Colors.redAccent,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ));
            }),
      ),
    ]);
  }
}
