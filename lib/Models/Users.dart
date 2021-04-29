class User {
  User({this.users, this.contacts});

  List<UserModel> users;
  List<Contact> contacts;

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserModel>.from(
            json["Users"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.name,
    this.department,
    this.batch,
    this.contacts,
  });
  int id;
  String email;
  String name;
  String department;
  String batch;
  List contacts;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["Email"],
      name: json["Name"],
      department: json["Department"],
      batch: json["Batch"],
      contacts: json["Contacts"] != null
          ? List<Contact>.from(json["Contacts"].map((x) => Contact.fromJson(x)))
          : null);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Email": email,
        "Name": name,
        "Department": department,
        "Batch": batch,
        "Contacts": contacts != null
            ? List<dynamic>.from(contacts.map((x) => x.toJson()))
            : null
      };
}

class Contact {
  Contact({
    this.id,
    this.email,
    this.name,
  });

  int id;
  String email;
  String name;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        email: json["Email"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Email": email,
        "Name": name,
      };
}
