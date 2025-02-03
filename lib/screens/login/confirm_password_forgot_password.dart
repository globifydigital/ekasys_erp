import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../gen/assets.gen.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/login_button.dart';

@RoutePage()
class ConfirmPasswordForgotPasswordScreen extends StatefulWidget {
  const ConfirmPasswordForgotPasswordScreen({super.key});

  @override
  State<ConfirmPasswordForgotPasswordScreen> createState() => _ConfirmPasswordForgotPasswordScreenState();
}

class _ConfirmPasswordForgotPasswordScreenState extends State<ConfirmPasswordForgotPasswordScreen> {

  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          toolbarHeight: 0.0
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
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
          child: Column(
            children: [
              Gap(40),
              Assets.images.ekasyslogo1.image(height: screenHeight * 0.05),
              Gap(100),
              Text("Forgot Password", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
              Gap(40),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: 'Enter new password',
                  prefixIcon: Icon(Iconsax.lock),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
              Gap(20),
              TextFormField(
                controller: _confirmPassword,
                decoration: const InputDecoration(
                  hintText: 'Confirm new password',
                  prefixIcon: Icon(Iconsax.lock),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
              Gap(40),
              LoginButton(
                showActions: false,
                title: "Reset Password",
                onPressed: (){
                  context.pushRoute(SignInRoute(departmentValue: "", departmentId: ""));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
