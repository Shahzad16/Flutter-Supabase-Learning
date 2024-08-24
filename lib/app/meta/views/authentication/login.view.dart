import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/app/meta/views/authentication/login.with.phone.view.dart';
import 'package:flutter_supabase_tutorial/app/routes/app.routes.dart';
import 'package:flutter_supabase_tutorial/core/notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    await authenticationNotifier.login(
                        context: context, email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Fill the credentials')));
                  }
                },
                child: const Text("Login with Email")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginWithPhone()));
                },
                child: Text('Sign in with Phone Number')),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.SignupRoute);
                },
                child: const Text("New Here? Signup"))
          ],
        ),
      ),
    );
  }
}
