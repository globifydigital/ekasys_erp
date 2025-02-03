import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../gen/assets.gen.dart';
import '../../routes/app_router.gr.dart';
import '../../widgets/login_button.dart';


@RoutePage()
class URLEnteringScreen extends StatefulWidget {
  const URLEnteringScreen({super.key});

  @override
  State<URLEnteringScreen> createState() => _URLEnteringScreenState();
}

class _URLEnteringScreenState extends State<URLEnteringScreen> {

  var _url = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _url.text = "http://";
  }

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
          child: Column(
            children: [
              Gap(40),
              Assets.images.ekasyslogo1.image(height: screenHeight * 0.05),
              Gap(100),
              Text("URL", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              Gap(100),
              TextFormField(
                controller: _url,
                decoration: const InputDecoration(
                  hintText: 'Enter base url',
                  prefixIcon: Icon(Iconsax.setting),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
              Gap(60),
              LoginButton(
                showActions: false,
                title: "Next",
                onPressed: (){
                  if (_url.text == "http://" || _url.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter base url'),
                        duration: Duration(milliseconds: 600),),
                    );
                  }
                  HiveRepo.instance.setBaseUrl(baseUrl: _url.text);
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
