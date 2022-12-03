import 'package:flutter/material.dart';
import 'package:inote_application/screens/note_list.dart';
import 'package:inote_application/auth.dart';
import 'package:inote_application/screens/auth_screen.dart';

class startpage extends StatefulWidget {

  @override
  _startpageState createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  AuthClass authClass = AuthClass();
  Widget currentPage = SignUpPage();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    String token = await authClass.getToken();
    print("token");
    if (token != null)
      setState(() {
        currentPage = NoteList();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
    );
  }
}
