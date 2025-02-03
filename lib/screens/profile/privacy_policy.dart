import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.gr.dart';


@RoutePage()
class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  Future<bool> _onWillPop() async {
    await context.pushRoute(const HomeRoute());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          centerTitle: true,
          leading: GestureDetector(
              onTap: (){
                context.pushRoute(HomeRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
          title: const Text("Privacy Policy", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Our ERP privacy policy ensures the protection of  information. We collect and process commercial and personal information to provide our services and use appropriate security measures to protect this information. We will not disclose your personal information without your consent, and you have the right to access, correct, and delete your information."),
        )
      ),
    );
  }
}
