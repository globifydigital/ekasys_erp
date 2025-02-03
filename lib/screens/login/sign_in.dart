import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/providers/login/userLogin_provider.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../gen/assets.gen.dart';
import 'package:iconsax/iconsax.dart';

import '../../global.dart';
import '../../widgets/login_button.dart';

@RoutePage()
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key,required this.departmentValue, required this.departmentId});

  final String departmentValue;
  final String departmentId;

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState( this.departmentValue, this.departmentId);
}

class _SignInScreenState extends ConsumerState<SignInScreen> {

  final _formKey = GlobalKey<FormState>();

  String? departmentValue;
  String? departmentId;
  var _userName = TextEditingController();
  var _password = TextEditingController();
  var _department = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userName.text = userNameStored;
    _password.text = passwordStored;
    _department.text = departmentValue.toString();
  }

  _SignInScreenState(this.departmentValue, this.departmentId);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () async{
        context.pushRoute(const URLEnteringRoute());
        return true;
      },
      child: Scaffold(
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
            height: MediaQuery.of(context).size.height * 1.5,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(bottom: keyboardHeight),
                  child: Column(
                    children: [
                      Gap(40),
                      Assets.images.ekasyslogo1.image(height: screenHeight * 0.05),
                      Gap(100),
                      Text("Login", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                      Gap(40),
                      TextFormField(
                        controller: _userName,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          prefixIcon: Icon(Iconsax.user),
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                          prefixIconConstraints: BoxConstraints(minWidth: 50),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (v){
                          _userName.text = v.toString();
                          userNameStored = _userName.text;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (v){
                          _password.text = v.toString();
                          passwordStored = _password.text;
                        },
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.pushRoute(ForgotPasswordRoute());
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Text(
                                  "Forgot password ?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(40),
                      TextFormField(
                        controller: _department,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Select department',
                          prefixIcon: Icon(Iconsax.buildings4),
                          suffixIcon: Icon(Iconsax.arrow_right),
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                          prefixIconConstraints: BoxConstraints(minWidth: 50),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cannot be empty';
                          }
                          return null;
                        },
                        onTap: (){
                          context.pushRoute(DepartmentsListingRoute());
                        },
                      ),
                      Gap(40),
                      LoginButton(
                        showActions: false,
                        title: "Login",
                        onPressed: (){
                          _login();
                        },
                      ),
                      Gap(60),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //         "Not a member ? ",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.white,
                      //         )
                      //     ),
                      //     GestureDetector(
                      //       onTap: (){
                      //         context.pushRoute(SignUpRoute());
                      //       },
                      //       child: Text(
                      //           "Register now",
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,
                      //           )
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    // setState(() {
    //   submitting = true;
    // });

    try {
      var userDetails = await ref.read(userDetailsProvider).registerUser(
        UserLoginId: "0",
        UserName: _userName.text,
        Password: _password.text,
        DeptID: departmentId.toString(),
      );
      if(userDetails.oList!.isNotEmpty){
        HiveRepo.instance.user = userDetails;
        userNameStored = "";
        passwordStored = "";
        context.pushRoute(HomeRoute());
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please check your username or password'),
            duration: Duration(milliseconds: 600),),
        );
      }

      // ignore: use_build_context_synchronously
      // Navigator.pop(context);
    } catch (e) {
      // ignore: use_build_context_synchronously
    }
    // setState(() {
    //   submitting = false;
    // });
  }
}
