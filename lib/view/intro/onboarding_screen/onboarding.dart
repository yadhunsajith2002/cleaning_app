import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/auth/create_account/ceate_acc_screen.dart';

import 'package:cleaning_app/view/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.2,
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://t4.ftcdn.net/jpg/02/22/07/49/360_F_222074985_CwcuLMkQ0NBU2Qv1lqHD5XpHYtkY8mAB.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/onPng.png",
                height: 200,
                width: 250,
              ),
              CustumIcon(
                fontSize: 45,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                foregroundColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CreateAccountScreen(),
              ));
            },
            child: Text(
              "Get Started",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already Have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }
}
