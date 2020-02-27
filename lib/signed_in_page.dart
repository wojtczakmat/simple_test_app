import 'package:flutter/material.dart';

class SignedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'You are signed in :)',
          key: Key('signedInText'),
        ),
      ),
    );
  }
}
