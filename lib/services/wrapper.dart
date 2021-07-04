import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amigoproject/services/initial_builder.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Amigo();
    }
  }
}
