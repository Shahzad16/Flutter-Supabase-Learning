import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/service/authentication.service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<String?> signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final response = await _authenticationService.signUp(
          context: context, email: email, password: password);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final response = await _authenticationService.login(
          context: context, email: email, password: password);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> sendVerificationCode(
      {required BuildContext context, required String phoneNumber}) async {
    try {
      final response = await _authenticationService.SendVerificationCode(
          context: context, phoneNumber: phoneNumber);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> verifyPhoneNumber(
      {required BuildContext context,
      required String phoneNumber,
      required String otp}) async {
    try {
      final response = await _authenticationService.verifyPhoneNumber(
          context: context, token: otp, phoneNumber: phoneNumber);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> loginWithGithub({required BuildContext context}) async{
    try{
      await _authenticationService.loginWithGithub(context: context);
    }catch(e){
      print(e);
    }
  }
}
