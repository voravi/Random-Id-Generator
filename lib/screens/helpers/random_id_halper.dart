import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_person_id_generator/screens/modals/random_people.dart';

class RandomPeople {
  RandomPeople._();

  static final RandomPeople randomPeople = RandomPeople._();

  Future<List<Peoples>?> fetchRandomData() async {
    http.Response response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      print(data);

      List<dynamic> decodedData = data["results"];

      List<Peoples> peopleData = decodedData.map(
        (e) => Peoples.fromMap(data: e),
      ).toList();

      return peopleData;
    }

    return null;
  }
}
