import 'dart:io';

class Peoples {
  final String gender;
  final String title;
  final String first;
  final String last;
  final String city;
  final String state;
  final String country;
  final String date;
  final int age;
  final String phone;
  final String large;

  Peoples({
    required this.city,
    required this.country,
    required this.title,
    required this.phone,
    required this.age,
    required this.date,
    required this.first,
    required this.gender,
    required this.large,
    required this.last,
    required this.state,
  });

  factory Peoples.fromMap({required Map data}) {
    return Peoples(
      gender: data["gender"],
      title: data["name"]["title"],
      first: data["name"]["first"],
      last: data["name"]["last"],
      city: data["location"]["city"],
      country: data["location"]["country"],
      state: data["location"]["state"],
      phone: data["phone"],
      age: data["dob"]["age"],
      date: data["dob"]["date"],
      large: data["picture"]["large"],
    );
  }
}
