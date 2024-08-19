import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/app/routes/app.routes.dart';
import 'package:flutter_supabase_tutorial/core/notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup View"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    await authenticationNotifier.signUp(context: context,
                        email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill the credentials')));
                  }
                },
                child: const Text("Sign up")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.LoginRoute);
                },
                child: const Text('Already have an account? Login'))
          ],
        ),
      ),
    );
  }
}
