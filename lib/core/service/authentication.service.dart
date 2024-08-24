import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/app/meta/views/home.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  final supabase = Supabase.instance.client;
  Future<String?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        String? userEmail = response.user!.email;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('SignUp successful: $userEmail')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('SignUp failed: ${response.user}')),
        );
        print(response.user);
      }
    } on AuthApiException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: Unexpected error: $e')),
      );
      print(e);
    }
    return null;
  }

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful: ${response.user!.email}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed: No user returned.')),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: Unexpected error: $e')),
      );
    }
    return null;
  }

  Future<void> SendVerificationCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await supabase.auth.signInWithOtp(
        phone: phoneNumber,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification code sent successfully.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error: $e')),
      );
    }
  }

  Future verifyPhoneNumber(
      {required BuildContext context,
      required String token,
      required String phoneNumber}) async {
    try {
      await supabase.auth
          .verifyOTP(type: OtpType.sms, token: token, phone: phoneNumber);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
