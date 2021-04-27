import 'dart:convert';
import 'package:flutter_api/Models/Users.dart';
import 'package:flutter_api/Models/create_user.dart';
import 'package:http/http.dart' as http;

class APIManager {
  var client = http.Client();
  // ignore: avoid_init_to_null
  var userModel;
  String url = 'http://localhost:3000/db';
  Future<MyApi> getUsers() async {
    return await client.get(url).then((response) {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        userModel = MyApi.fromJson(jsonMap);
      }
      return userModel;
    }).catchError((e) => userModel);
  }

  Future<MyApi> createUsers(CreateUser createUser) async {
    return await client.post('http://localhost:3000/Users',
        body: json.encode(createUser),
        headers: {"Content-Type": "application/json"}).then((response) {
      print('${response.body}\n ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('YESSSSSSSSSSSSSSSSSSSS');
      }
    }).catchError((e) {
      print('NOOOOOOOOOOOOOOOOOOOO');
    });
  }

  Future<MyApi> updateUsers(CreateUser createUser, int id) async {
    return await client.put('http://localhost:3000/Users/$id',
        body: json.encode(createUser),
        headers: {"Content-Type": "application/json"}).then((response) {
      print('${response.body}\n ${response.statusCode}');
      if (response.statusCode == 200) {
        print('YESSSSSSSSSSSSSSSSSSSS');
      }
    }).catchError((e) {
      print('NOOOOOOOOOOOOOOOOOOOO');
    });
  }

  Future<MyApi> deleteUsers(int id) async {
    return await client.delete('http://localhost:3000/Users/$id',
        headers: {"Content-Type": "application/json"}).then((response) {
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        print('YESSSSSSSSSSSSSSSSSSSS');
      }
    }).catchError((e) {
      print('NOOOOOOOOOOOOOOOOOOOO');
    });
  }
}
