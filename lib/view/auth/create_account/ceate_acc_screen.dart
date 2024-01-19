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
    var provider = context.read<CreateAccountController>();
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
                  child: Form(
                    key: provider.CformKey,
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
                            style:
                                textStyle(size: 16, weight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        CustumformField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter name";
                            }
                            return null;
                          },
                          hint: "Full name",
                          isObscure: false,
                          controller: provider.userNameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Email",
                          style: textStyle(size: 16, weight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustumformField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return provider.emailError;
                            }
                            return null;
                          },
                          hint: "Email",
                          isObscure: false,
                          controller: provider.emailController,
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
                          icon: InkWell(
                            onTap: () {
                              provider.obscureTextView();
                            },
                            child: provider.isShow
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return provider.passwordError;
                            }
                            return null;
                          },
                          hint: "Password",
                          isObscure: provider.isShow,
                          controller: provider.passwordController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: provider.isLoading
                              ? CircularProgressIndicator(
                                  color: kprimary,
                                )
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(kprimary),
                                      foregroundColor:
                                          MaterialStatePropertyAll(ksecondary)),
                                  onPressed: () async {
                                    provider.setLoading(true);
                                    await provider.createAccount(context);
                                    provider.setLoading(false);
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
              ),
            );
          },
        ));
  }
}
