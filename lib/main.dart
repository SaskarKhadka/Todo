import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:todo/screens/signup_screen.dart';
import 'package:todo/state/password_eye.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PasswordEyeState()),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Login.id,
        routes: {
          Login.id: (context) => const Login(),
          Signup.id: (context) => const Signup(),
        },
      ),
    );
  }
}
