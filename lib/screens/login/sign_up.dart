import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../gen/assets.gen.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/login_button.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var _userName = TextEditingController();
  var _mobile = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          toolbarHeight: 0.0
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight * 0.97,
          padding: EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF37EB58),
                    Color(0xFF3B74ED),
                  ]
              )
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Gap(40),
                Assets.images.ekasyslogo1.image(height: screenHeight * 0.05),
                Gap(100),
                Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                Gap(40),
                TextFormField(
                  controller: _userName,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Iconsax.user),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                  ),
                ),
                Gap(20),
                TextFormField(
                  controller: _mobile,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Iconsax.mobile),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                  ),
                ),
                Gap(20),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: Icon(Iconsax.card),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                  ),
                ),
                Gap(20),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Iconsax.lock),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                  ),
                ),
                Gap(20),
                TextFormField(
                  controller: _confirmPassword,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Iconsax.lock),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                  ),
                ),
                Gap(40),
                LoginButton(
                  showActions: false,
                  title: "Sign Up",
                  onPressed: (){},
                ),
                Gap(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Already have an account ? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        context.pushRoute(SignUpRoute());
                      },
                      child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
