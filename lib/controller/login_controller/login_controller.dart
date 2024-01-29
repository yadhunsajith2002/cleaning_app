import 'package:cleaning_app/services/auth_service/auth_service.dart';
import 'package:cleaning_app/view/auth/create_account/ceate_acc_screen.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    try {
      setLoading(true);
      bool loginSuccess = await AuthService().login(
        emailController.text.trim(),
        passwordController.text.trim(),
        context,
      );
      if (!loginSuccess) {
        // Show a Snackbar
        final snackBar = SnackBar(
          content: Text('Email or password is incorrect'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ScreenHome(),
            ),
            (route) => false);
      }
    } catch (e) {
      print("Error creating account: $e");
    } finally {
      setLoading(false);
    }
  }

  bool isShow = false;

  void obscureTextView() {
    isShow = !isShow;
    notifyListeners();
  }

  void setLoading(bool value) {
    // Set loading state
    isLoading = value;
    notifyListeners();
  }
}
