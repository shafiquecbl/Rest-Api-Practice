import 'package:flutter/widgets.dart';

class CreateUser {
  CreateUser(
      {@required this.email, this.name, this.department, this.batch, this.id});

  String email;
  String name;
  String department;
  String batch;
  int id;

  Map<String, dynamic> toJson() => {
        "id": id,
        "Email": email,
        "Name": name,
        "Department": department,
        "Batch": batch,
      };
}
