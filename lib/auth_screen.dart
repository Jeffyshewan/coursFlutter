import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if(value != null && value.isEmpty) {
                  return "ERREUR";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _password,
            ),
            ElevatedButton(onPressed: () async {
              var test = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text, 
                  password: _password.text
              );
              setState(() {
                print(test.user?.email);
              });
            }, child: Text('Valider'))
          ],
        ),
      ),
    );
  }
}

