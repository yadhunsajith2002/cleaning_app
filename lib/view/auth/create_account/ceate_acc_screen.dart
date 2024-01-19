import 'package:cleaning_app/controller/create_account_controller/create_account_controller.dart';
import 'package:cleaning_app/core/colors/colors.dart';
import 'package:cleaning_app/core/styles/textstyles.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/global%20widgets/textform_fields.dart';

import 'package:cleaning_app/view/auth/login_screen/login_screen.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustumIcon(
            fontSize: 25,
          ),
        ),
        body: Consumer<CreateAccountController>(
          builder: (context, value, child) {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: ksecondary,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create Account", style: textStyle()),
                      Text("Sign up to get Started",
                          style: textStyle(size: 16, color: kgrey)),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Full name",
                          style: textStyle(size: 16, weight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      CustumformField(
                        hint: "Full name",
                        isObscure: false,
                        controller: value.userNameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: textStyle(size: 16, weight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustumformField(
                        hint: "Email",
                        isObscure: false,
                        controller: value.emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Password",
                        style: textStyle(size: 16, weight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustumformField(
                        hint: "Password",
                        isObscure: true,
                        controller: value.passwordController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(kprimary),
                              foregroundColor:
                                  MaterialStatePropertyAll(ksecondary)),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => ScreenHome(),
                            ));
                          },
                          child: Text("Sign Up",
                              style: textStyle(
                                  size: 18,
                                  color: ksecondary,
                                  weight: FontWeight.bold)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(color: kprimary),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Sign Up With"),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              height: 40,
                              width: 30,
                              child: Image.asset("assets/icons/google.png"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
