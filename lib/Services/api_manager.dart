import 'dart:convert';
import 'package:flutter_api/Models/Users.dart';
import 'package:flutter_api/Models/create_user.dart';
import 'package:http/http.dart' as http;

class APIManager {
  var client = http.Client();
  var userModel;

  ///////////////////////////////////////////////////////////

  Future<User> getUsers() async {
    return await client.get('http://localhost:3000/db').then((response) {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        userModel = User.fromJson(jsonMap);
      }
      return userModel;
    }).catchError((e) => userModel);
  }

  Future<User> createUsers(CreateUser createUser) async {
    return await client.post('http://localhost:3000/Users',
        body: json.encode(createUser),
        headers: {"Content-Type": "application/json"}).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('YES');
      }
    }).catchError((e) {
      print('NO');
    });
  }

  Future updateUsers(CreateUser createUser, int id) async {
    return await client.put('http://localhost:3000/Users/$id',
        body: json.encode(createUser),
        headers: {"Content-Type": "application/json"}).then((response) {
      if (response.statusCode == 200) {
        print('YES');
      }
    }).catchError((e) {
      print('NO');
    });
  }

  Future deleteUsers(int id) async {
    return await client.delete('http://localhost:3000/Users/$id',
        headers: {"Content-Type": "application/json"}).then((response) {
      if (response.statusCode == 200) {
        print('YES');
      }
    }).catchError((e) {
      print('NO');
    });
  }
}
