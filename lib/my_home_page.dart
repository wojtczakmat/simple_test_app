import 'package:flutter/material.dart';
import 'package:simple_app/signed_in_page.dart';
import 'package:simple_app/username_validator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username;
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Please sign in to our service'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  key: Key('textField'),
                  onChanged: (text) {
                    setState(() {
                      username = text;
                    });
                  },
                ),
              ),
              if (!isValid)
                Text(
                  'Please provide a correct username',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('submit'),
        onPressed: _signIn,
        tooltip: 'Sign in',
        child: Icon(Icons.done),
      ),
    );
  }

  void _signIn() {
    final valid = validateUsername(username);
    setState(() {
      isValid = valid;
    });

    if (valid) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return SignedInPage();
      }));
    }
  }
}
