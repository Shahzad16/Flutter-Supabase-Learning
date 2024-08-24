import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Login with Phone')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(hintText: 'Enter Phone Number'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: otpController,
              decoration: const InputDecoration(hintText: 'Enter OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                authenticationNotifier.sendVerificationCode(
                    context: context, phoneNumber: phoneNumberController.text);
              },
              child: const Text('Send Verification'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  authenticationNotifier.verifyPhoneNumber(
                      context: context,
                      phoneNumber: phoneNumberController.text,
                      otp: otpController.text);
                },
                child: const Text('Verify Phone Number'))
          ]),
    );
  }
}
