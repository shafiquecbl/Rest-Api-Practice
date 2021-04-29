class User {
  User({
    this.users,
  });

  List<UserModel> users;

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
      contacts: json["Contacts"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Email": email,
        "Name": name,
        "Department": department,
        "Batch": batch,
        "Contacts": contacts
      };
}

/////////////////////////////////////////////////////////////////////////////

class Contacts {
  Contacts({
    this.contacts,
  });

  List<ContactsModel> contacts;

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        contacts: List<ContactsModel>.from(
            json["Contacts"].map((x) => ContactsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
      };
}

class ContactsModel {
  ContactsModel({
    this.id,
    this.email,
    this.name,
  });
  int id;
  String email;
  String name;

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
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
