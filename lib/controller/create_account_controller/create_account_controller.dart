import 'package:cleaning_app/services/auth_service/auth_service.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateAccountController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool isLoading = false; // Add isLoading variable

  bool isShow = false;

  void obscureTextView() {
    isShow = !isShow;
    notifyListeners();
  }

  Future<void> createAccount(BuildContext context) async {
    try {
      // Start loading
      setLoading(true);

      // Create an account in Firebase Authentication
      bool createUser = await AuthService().createAccount(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (!createUser) {
        final snackBar = SnackBar(
          content: Text('Unable To Create Account'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      } else {
        await storeUsersInFireStore();

        // Navigate to the appropriate screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ScreenHome()),
          (route) => false,
        );
      }
    } catch (e) {
      print("Error creating account: $e");
      // Handle errors as needed
    } finally {
      // Stop loading
      setLoading(false);
    }
  }

  Future<void> storeUsersInFireStore() async {
    try {
      // Get the current user
      // var user = await AuthService().getCurrentUser();

      // Store chef information in Firestore with automatically generated ID
      var users = FirebaseFirestore.instance.collection('users').doc();
      await users.set({
        'id': users.id,
        'username': userNameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text
        // Add other chef information if needed
      });
    } catch (e) {
      print("Error storing chef in Firestore: $e");
      // Handle errors as needed
    }
  }

  void setLoading(bool value) {
    // Set loading state
    isLoading = value;
    notifyListeners();
  }
}
