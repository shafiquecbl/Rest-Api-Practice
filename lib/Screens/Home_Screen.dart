import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/Screens/Create/create.dart';
import 'package:flutter_api/Screens/Update/update.dart';
import 'package:flutter_api/Services/api_manager.dart';
import 'package:flutter_api/constants.dart';
import 'package:flutter_api/navigator.dart';

import '../Models/Users.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<User> _userModel;
  @override
  void initState() {
    _userModel = APIManager().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rest API'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CreateData()))
                    .then((value) {
                  setState(() {
                    _userModel = APIManager().getUsers();
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder<User>(
        future: _userModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.data.users.length != 0) {
            return ListView.builder(
                itemCount: snapshot.data.users.length,
                itemBuilder: (context, index) {
                  var user = snapshot.data.users[index];
                  var contact = user.contacts;
                  return Card(
                    elevation: 2,
                    shadowColor: Colors.purpleAccent,
                    child: ExpansionTile(
                      title: Text(user.email),
                      children: [
                        Text(contact != null ? contact[0].name : 'No Contacts'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(
                                        builder: (_) => UpdateData(
                                              id: user.id,
                                              email: user.email,
                                              name: user.name,
                                              department: user.department,
                                              batch: user.batch,
                                            )))
                                    .then((value) => setState(() {
                                          _userModel = APIManager().getUsers();
                                        }));
                              },
                              icon: Icon(Icons.update),
                              label: Text('Update'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  minimumSize: Size(150, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                APIManager().deleteUsers(user.id).then((value) {
                                  showDeletedDialog(context);
                                });
                              },
                              icon: Icon(Icons.delete),
                              label: Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  minimumSize: Size(150, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                });
          } else
            return Center(child: Text('No Data'));
        },
      ),
    );
  }

  showDeletedDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
              title: Text('User Deleted Succeddfully!'),
              content: CupertinoDialogAction(
                child: Text("Done"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _userModel = APIManager().getUsers();
                  });
                },
              ));
        });
  }
}
