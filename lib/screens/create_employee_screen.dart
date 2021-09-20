import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:rna_learning/components/alert.dart';
import 'package:rna_learning/models/employee.dart';
import 'package:rna_learning/models/employees.dart';

// ignore: must_be_immutable
class CreateEmployeePage extends StatefulWidget {
  Employee? employee;
  CreateEmployeePage({this.employee, Key? key}) : super(key: key);

  @override
  _CreateEmployeePageState createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  TextEditingController nameCtrl = TextEditingController(),
      lstNameCtrl = TextEditingController(),
      photoUrlCtrl = TextEditingController(),
      jobCtrl = TextEditingController(),
      dateCtrl = TextEditingController();
  DateTime? dateOfBirth;

  void loadData() {
    if (widget.employee != null) {
      String? name = widget.employee != null ? widget.employee?.name : '';
      String? lstName =
          widget.employee != null ? widget.employee?.lastName : '';
      String? job = widget.employee != null ? widget.employee?.job : '';
      String? photo = widget.employee != null ? widget.employee?.photoUrl : '';
      dateOfBirth = widget.employee != null
          ? widget.employee?.dateOfBirth
          : DateTime(0, 0, 0);
      nameCtrl.text = name ?? '';
      lstNameCtrl.text = lstName ?? '';
      jobCtrl.text = job ?? '';
      photoUrlCtrl.text = photo ?? '';
      dateCtrl.text =
          DateFormat('MMM dd, yyyy').format(dateOfBirth ?? DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Employee"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                backgroundImage: NetworkImage(photoUrlCtrl.text != ""
                    ? photoUrlCtrl.text
                    : 'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                radius: 70,
              ),
              TextFormField(
                decoration: inputDecoration(placeholder: "Name"),
                controller: nameCtrl,
              ),
              TextFormField(
                decoration: inputDecoration(placeholder: "Last Name"),
                controller: lstNameCtrl,
              ),
              TextFormField(
                decoration: inputDecoration(placeholder: "Job"),
                controller: jobCtrl,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: inputDecoration(
                          placeholder: "Photo Url",
                          icon: const Icon(Icons.image)),
                      controller: photoUrlCtrl,
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              photoUrlCtrl.text = '';
                            });
                          },
                          child: const Expanded(
                            child: Text("Remove"),
                          )))
                ],
              ),
              TextFormField(
                  controller: dateCtrl,
                  decoration: inputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    placeholder: "Date of your birth",
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? date = await datePicker(context);
                    setState(() {
                      dateOfBirth = date;
                      dateCtrl.text = DateFormat("MMMM dd, yyyy")
                          .format(date ?? DateTime(0, 0, 0));
                    });
                  }),
            ],
          )),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  //Save employee
                  _saveEmployee();
                },
                child: Text(widget.employee == null ? "Save" : "Save Changes",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    )),
              ))),
    );
  }

  InputDecoration inputDecoration({String? placeholder, Icon? icon}) {
    return InputDecoration(
      icon: icon,
      labelText: placeholder,
    );
  }

  void _saveEmployee() {
    if (nameCtrl.text.isNotEmpty &&
        lstNameCtrl.text.isNotEmpty &&
        jobCtrl.text.isNotEmpty &&
        dateOfBirth != null) {
      var nwEmp = Employee(
        dateOfBirth ?? DateTime.now(),
        name: nameCtrl.text,
        lastName: lstNameCtrl.text,
        job: jobCtrl.text,
        photoUrl: photoUrlCtrl.text,
      );
      if (widget.employee != null) {
        update(nwEmp, widget.employee?.id);
      } else {
        modelEmployees.add(nwEmp);
      }
      Navigator.pop(context);
    } else {
      alert(
        context,
        message: "Please, fill all fields",
        color: Colors.red,
        duration: 2,
      );
    }
  }
}

Future<DateTime?> datePicker(context) => DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1970, 1, 1),
      maxTime: DateTime(2022, 12, 31),
      currentTime: DateTime.now(),
      locale: LocaleType.es,
    );
