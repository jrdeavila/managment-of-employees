import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:rna_learning/components/alert.dart';
import 'package:rna_learning/components/card_employee.dart';
import 'package:rna_learning/models/employee.dart';
import 'package:rna_learning/models/employees.dart';
import 'package:rna_learning/screens/create_employee_screen.dart';

// ignore: must_be_immutable
class EmployeesPage extends StatefulWidget {
  Employees employees;
  EmployeesPage(this.employees, {Key? key}) : super(key: key);
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
      ),
      body: ListEmployees(widget.employees),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateEmployeePage(widget.employees)));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

// ignore: must_be_immutable
class ListEmployees extends StatefulWidget {
  Employees employees;
  ListEmployees(this.employees, {Key? key}) : super(key: key);
  @override
  _ListEmployeesState createState() => _ListEmployeesState();
}

class _ListEmployeesState extends State<ListEmployees> {
  String _filter = "";
  var findController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Employee> listEmployees = widget.employees.employees;
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          decoration: const InputDecoration(
            labelText: "Find employees",
          ),
          controller: findController,
          onChanged: (text) {
            setState(() {
              _filter = text;
            });
            listEmployees = widget.employees.filterByString(_filter);
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: listEmployees.length,
            itemBuilder: (context, index) {
              final crtEmp = listEmployees[index];
              return Dismissible(
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
                    widget.employees.employees.removeAt(index);
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
              );
            }),
      ),
    ]);
  }
}

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
