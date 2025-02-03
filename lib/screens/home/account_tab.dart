
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/login/userLogin_model.dart';
import '../../rest/hive_repo.dart';

@RoutePage()
class AccountTab extends ConsumerStatefulWidget {
  const AccountTab({super.key});

  @override
  ConsumerState<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends ConsumerState<AccountTab>
    with AutomaticKeepAliveClientMixin {

  UserLoginModel userLoginModel = UserLoginModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLoginModel = HiveRepo.instance.user!;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                SizedBox(
                  width: double.maxFinite,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(Icons.person, size: MediaQuery.of(context).size.width * 0.2,color: Colors.grey.shade300,),
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(userLoginModel.oList![0].dCompanyName.toString(), style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
                const SizedBox(height: 5,),
                Text(userLoginModel.oList![0].dPhoneNo != null ? userLoginModel.oList![0].dPhoneNo.toString() : "", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),),
                const SizedBox(height: 50,),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("About Us", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Admin", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reports", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Helps & Support", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      context.pushRoute(PrivacyPolicyRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Privacy Policy", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                        Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      context.pushRoute(TermsAndConditionsRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Terms & Conditions", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                        Icon(Icons.arrow_forward_ios, size: 18,color: Colors.blueAccent,)
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 25,),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text("Rate Us", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                //       Icon(Icons.arrow_forward_ios, size: 20,color: Colors.blueAccent,)
                //     ],
                //   ),
                // ),
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      HiveRepo.instance.logout();
                      context.pushRoute(URLEnteringRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, size: 25,color: Colors.green,),
                        SizedBox(width: 10,),
                        Text("Log out", style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}