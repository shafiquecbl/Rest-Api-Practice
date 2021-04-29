import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/Models/create_user.dart';
import 'package:flutter_api/Services/api_manager.dart';

class UpdateData extends StatefulWidget {
  final int id;
  final String email;
  final String name;
  final String department;
  final String batch;
  UpdateData(
      {@required this.id,
      @required this.email,
      @required this.name,
      @required this.department,
      @required this.batch});
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String batch;
  String department;
  String name;
  //////////////////////
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  /////////////////////
  Widget box = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  getEmail(),
                  box,
                  getName(),
                  box,
                  getBatch(),
                  box,
                  getDepartment(),
                  box,
                  box,
                  box,
                  box,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (email == null) {
                          email = widget.email;
                        }
                        if (name == null) {
                          name = widget.name;
                        }
                        if (department == null) {
                          department = widget.department;
                        }
                        if (batch == null) {
                          batch = widget.batch;
                        }
                        APIManager()
                            .updateUsers(
                                CreateUser(
                                    email: email,
                                    department: department,
                                    batch: batch,
                                    name: name),
                                widget.id)
                            .then((value) {
                          showUpdatedDialog(context);
                        });
                      }
                    },
                    child: Text('Update'),
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 1.5, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget getEmail() {
    return TextFormField(
      initialValue: widget.email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'Enter your email');
          // print('Enter your email');
        }
        email = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          // addError(error: 'Enter your email');
          print('Enter your email');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.email),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }

  Widget getName() {
    return TextFormField(
      initialValue: widget.name,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'Enter your name');
        }
        name = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          // addError(error: 'Enter your name');
          print('Enter your name');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.verified_user),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }

  Widget getBatch() {
    return TextFormField(
      initialValue: widget.batch,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => batch = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'Enter your batch');
        }
        batch = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          // addError(error: 'Enter your batch');
          print('Enter your batch');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Batch",
          hintText: "Enter your batch",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.info),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }

  Widget getDepartment() {
    return TextFormField(
      initialValue: widget.department,
      onSaved: (newValue) => department = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // removeError(error: 'Enter your department');
        }
        department = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          // addError(error: 'Enter your department');
          print('Enter your department');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Department",
          hintText: "Enter your department",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.description),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }

  showUpdatedDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
              title: Text('User Updated Succeddfully!'),
              content: CupertinoDialogAction(
                child: Text("Done"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ));
        });
  }
}
