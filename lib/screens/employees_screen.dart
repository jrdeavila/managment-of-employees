import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:rna_learning/models/employee.dart';
import 'package:rna_learning/models/employees.dart';
import 'package:rna_learning/screens/create_employee_screen.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

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
      body: ListEmployees(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateEmployeePage()));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class ListEmployees extends StatefulWidget {
  ListEmployees({Key? key}) : super(key: key);
  @override
  _ListEmployeesState createState() => _ListEmployeesState();
}

class _ListEmployeesState extends State<ListEmployees> {
  Employees employees = Employees();
  String _filter = "";
  final _findController = TextEditingController();
  List<Employee> listEmployees = <Employee>[];

  _ListEmployeesState() {
    listEmployees = employees.employees;
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
          controller: _findController,
          onChanged: (text) {
            setState(() {
              _filter = text;
            });
            listEmployees = employees.filterByString(_filter);
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
                onDismissed: (direction) {
                  setState(() {
                    employees.employees.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.pink,
                    content: Text('Employee ${crtEmp.name} was deleted',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ));
                },
                background: Container(color: Colors.pink),
              );
            }),
      ),
    ]);
  }
}

class CardEmployee extends StatelessWidget {
  Employee employee;
  CardEmployee(this.employee, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  backgroundImage: NetworkImage(employee.photoUrl ?? ''),
                ),
                Column(
                  children: [
                    Text(
                      '${employee.name} ${employee.lastName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(employee.job,
                        style: const TextStyle(
                          color: Colors.pink,
                        ))
                  ],
                ),
                Column(children: [
                  Text('${employee.dateOfBirthToString}'),
                  Text("${employee.ageOfEmployee} Years"),
                ])
              ],
            )));
  }
}
