import 'package:cleaning_app/view/auth/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print('Error logging in: $e');

      return false;
    }
  }

  Future<String?> getLoggedInUserId() async {
    final User? user = _auth.currentUser;
    return user?.uid;
  }

  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      print("Error getting current user: $e");
      return null;
    }
  }

  Future<bool> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      print('Error creating account: $e');
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  Future<void> signOut(BuildContext context) async {
    // Add the logic to sign out here
    // For example, using Firebase Authentication:
    await FirebaseAuth.instance.signOut();

    // Navigate to the login screen upon successful sign out
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}
