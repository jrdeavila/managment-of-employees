import "employee.dart";

List<Employee> modelEmployees = <Employee>[
  Employee(DateTime(1994, 9, 29),
      name: "Yoheinis",
      lastName: "De avila",
      job: "Psychology",
      photoUrl:
          "https://scontent.fctg1-3.fna.fbcdn.net/v/t1.6435-9/82057885_564211307756307_3716651100644835328_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeErMKgAVU8eE45Z_denTfswxJwDJr3MbN7EnAMmvcxs3pCfFeNbl0Jsuh4CvXF1Gv79Ss8bFyuKfnLnHTjSudf3&_nc_ohc=JKVtMTAwdK8AX8cinhs&_nc_ht=scontent.fctg1-3.fna&oh=c47280de1c06325bdab95d434986cdf4&oe=6169E085"),
  Employee(DateTime(2001, 7, 15),
      name: "Jose",
      lastName: "De avila",
      job: "System Engineer",
      photoUrl:
          "https://scontent.fctg1-4.fna.fbcdn.net/v/t1.6435-9/198346841_4049782201775902_4036852022222741023_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeFMPvbgMjtThnanMQ70YoOa28BSGgCiVZPbwFIaAKJVk2xxmm8jyctVf-suOkHaJ3CKK-2xkfv6mp8vTPnWA-yr&_nc_ohc=Jix8ocBusdsAX94p29F&_nc_ht=scontent.fctg1-4.fna&oh=239fef25b6674fb4cb65462d591281a7&oe=616AA1FD")
];

List<Employee> filterByString(String filter) {
  var listFiltered = <Employee>[];
  for (var empy in modelEmployees) {
    if (empy.name.toLowerCase().contains(filter.toLowerCase()) ||
        empy.lastName.toLowerCase().contains(filter.toLowerCase())) {
      listFiltered.add(empy);
    }
  }

  return listFiltered;
}

bool update(Employee employee, var _id) {
  for (int i = 0; i < modelEmployees.length; i++) {
    if (modelEmployees[i].id == _id) {
      modelEmployees[i].name = employee.name;
      modelEmployees[i].lastName = employee.lastName;
      modelEmployees[i].photoUrl = employee.photoUrl;
      modelEmployees[i].job = employee.job;
      return true;
    }
  }
  return false;
}
