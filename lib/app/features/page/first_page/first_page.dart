import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Panel użytkownika'),
          backgroundColor: const Color(0xff7fab72),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'niezalogowany',
              ),
            ]));
  }
}
