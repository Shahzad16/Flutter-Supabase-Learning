import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/service/authentication.service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<String?> signUp(
      { required BuildContext context,
        required String email, required String password}) async {
    try {
      final response =
          await _authenticationService.signUp(context: context,email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> login(
      {required BuildContext context,required String email, required String password}) async {
    try {
      final response =
          await _authenticationService.login(context:context,email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
