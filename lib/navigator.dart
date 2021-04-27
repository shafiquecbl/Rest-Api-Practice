import 'package:flutter/material.dart';

push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

pushRoot(BuildContext context, Widget page) {
  return Navigator.of(context, rootNavigator: true)
      .push(MaterialPageRoute(builder: (_) => page));
}
