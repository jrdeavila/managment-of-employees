import 'package:intl/intl.dart';

class Employee {
  String name, lastName, job;
  String? photoUrl;
  DateTime dateOfBirth = DateTime.now();
  Employee(
    DateTime date, {
    this.name = "John",
    this.lastName = "Smith",
    this.job = "System Engineer",
    this.photoUrl,
  }) {
    dateOfBirth = date;
  }

  get ageOfEmployee {
    DateTime today = DateTime.now();
    int age = today.year - dateOfBirth.year;
    int monthCurrent = today.month;
    int monthOfBirth = dateOfBirth.month;
    if (monthCurrent > monthOfBirth) {
      age--;
    } else if (monthCurrent == monthOfBirth) {
      if (today.day > dateOfBirth.day) {
        age--;
      }
    }
    return age;
  }

  get dateOfBirthToString => DateFormat.yMMMMd().format(dateOfBirth);
}
