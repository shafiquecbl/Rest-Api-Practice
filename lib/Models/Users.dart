// MyApi welcomeFromJson(String str) => MyApi.fromJson(json.decode(str));
// String welcomeToJson(MyApi data) => json.encode(data.toJson());

class MyApi {
  MyApi({
    this.users,
  });

  List<User> users;

  factory MyApi.fromJson(Map<String, dynamic> json) => MyApi(
        users: List<User>.from(json["Users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.id,
    this.email,
    this.name,
    this.department,
    this.batch,
  });
  int id;
  String email;
  String name;
  String department;
  String batch;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["Email"],
        name: json["Name"],
        department: json["Department"],
        batch: json["Batch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Email": email,
        "Name": name,
        "Department": department,
        "Batch": batch,
      };
}
