import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/loginpageimage.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCreatingAccount == true ? 'Zarejestruj się' : 'Cześć',
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(isCreatingAccount == true
                    ? 'Zarejestruj się'
                    : 'Zaloguj się na swoje konto'),
                const SizedBox(
                  height: 15,
                ),
                TextFieldLogin(widget: widget),
                const SizedBox(
                  height: 20,
                ),
                TextFieldPassword(widget: widget),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Nie pamiętam hasła :/',
                  ),
                ),
              ],
            ),
          ),
          Text(errorMessage),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            onPressed: () async {
              if (isCreatingAccount == true) {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                } catch (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                }
              } else {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                } catch (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                }
              }
            },
            child: Text(
                isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się '),
          ),
          if (isCreatingAccount == false) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = true;
                });
              },
              child: const Text(
                'Utwórz konto',
              ),
            ),
          ],
          if (isCreatingAccount == true) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = false;
                });
              },
              child: const Text(
                'Masz już konto?',
              ),
            ),
          ]
        ]),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(1.5, 1.5),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        controller: widget.passwordController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            hintText: 'Hasło',
            prefixIcon: const Icon(Icons.key),
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(1.5, 1.5),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        controller: widget.emailController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          hintText: 'E-mail',
          prefixIcon: const Icon(Icons.email),
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
