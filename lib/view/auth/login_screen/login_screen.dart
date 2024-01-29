import 'package:cleaning_app/controller/login_controller/login_controller.dart';
import 'package:cleaning_app/core/colors/colors.dart';
import 'package:cleaning_app/core/styles/textstyles.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/global%20widgets/textform_fields.dart';
import 'package:cleaning_app/view/auth/create_account/ceate_acc_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustumIcon(
            fontSize: 25,
          ),
        ),
        body: Consumer<LoginController>(
          builder: (context, value, child) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(child: Consumer(
                  builder: (context, value, child) {
                    return Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Welcome", style: textStyle()),
                          Text("Enter Your Email and password",
                              style: textStyle(size: 16, color: kgrey)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Email",
                              style:
                                  textStyle(size: 16, weight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          CustumformField(
                            hint: "Email",
                            isObscure: provider.isShow,
                            controller: provider.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter an email";
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Enter valid email";
                              }
                              return null;
                            },
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
                            hint: "Password",
                            isObscure: provider.isShow,
                            controller: provider.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              }
                              if (value.length < 6) {
                                return "Password Length Must be 6";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("You don't Have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountScreen(),
                                    ));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
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
                                            MaterialStatePropertyAll(
                                                Colors.green),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        provider.setLoading(true);
                                        await provider.login(context);
                                        provider.setLoading(false);
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ),
            );
          },
        ));
  }
}
