import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
class CreateEmployeePage extends StatefulWidget {
  const CreateEmployeePage({Key? key}) : super(key: key);

  @override
  _CreateEmployeePageState createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  TextEditingController nameCtrl = TextEditingController(),
      lstNameCtrl = TextEditingController(),
      photoUrlCtrl = TextEditingController(),
      jobCtrl = TextEditingController(),
      dateCtrl = TextEditingController();
  InputDecoration inputDecoration(String placeholder) {
    return InputDecoration(
      labelText: placeholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Employee"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    photoUrlCtrl.text = "";
                    setState(() {});
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    backgroundImage: NetworkImage(photoUrlCtrl.text != ""
                        ? photoUrlCtrl.text
                        : 'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                    radius: 70,
                  ),
                ),
                TextFormField(
                  decoration: inputDecoration("Name"),
                ),
                TextFormField(
                  decoration: inputDecoration("Last Name"),
                ),
                TextFormField(
                  decoration: inputDecoration("Job"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: inputDecoration("Photo Url"),
                          controller: photoUrlCtrl),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              //load image of employee
                              setState(() {});
                            },
                            child: const Expanded(
                              child: Text("Load"),
                            )))
                  ],
                ),
                TextFormField(
                    controller: dateCtrl,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Date of your birth",
                    ),
                    readOnly: true,
                    onTap: () {
                        DatePicker.showDatePicker(context, showTitleActions: true,
                        minTime: DateTime(1970, 1,1),
                        maxTime: DateTime(2022, 12,31),
                        onConfirm: (date){
                          setState((){
                           dateCtrl.text = DateFormat("MMMM dd, yyyy").format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.es,
                        );
                    }
                ),
              ],
            )));
  }
}
