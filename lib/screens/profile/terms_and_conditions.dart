import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.gr.dart';


@RoutePage()
class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
            child: Text("ERP Terms and Conditions describe the agreement between the provider and the user, including important terms such as license, intellectual property rights, user responsibilities, ownership and liability information. This framework ensures responsible use, data protection and resolution, protecting The interests of both parties."),
          )
      ),
    );
  }
}

