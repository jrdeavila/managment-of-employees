import 'dart:convert';

import 'package:intl/intl.dart';
import "package:crypto/crypto.dart";

class Employee {
  var id;
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
    id = sha1.convert(utf8.encode(name));
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
