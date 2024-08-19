import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/app/credentials/supabase.credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  Future<String?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final supabase = Supabase.instance.client;
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
  }

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final supabase = Supabase.instance.client;
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
          SnackBar(content: Text('Login failed: No user returned.')),
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
  }
}
