import 'dart:async'; // Import for Timer
import 'package:auto_route/annotations.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gif/gif.dart'; // Import for AutoRoute

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{

  late GifController _gifController;
  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    Timer(const Duration(milliseconds: 3100), () {
      if(HiveRepo.instance.user == null){
        context.router.replace(const AppInformationRoute());
      }else{
        context.router.replace(const HomeRoute());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF37EB58),
      body: SafeArea(
        child: Gif(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          controller: _gifController,
          image: const AssetImage('assets/gif/splashgf.gif'),
          autostart: Autostart.loop,
          // placeholder: (context) => const Text('Loading...'),
          onFetchCompleted: () {
            _gifController.reset();
            _gifController.forward();
          },
        ),
      ),
    );
  }
}
