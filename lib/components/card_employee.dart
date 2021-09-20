import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rna_learning/models/employee.dart';

// ignore: must_be_immutable
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
                  backgroundImage: NetworkImage(employee.photoUrl ??
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
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
