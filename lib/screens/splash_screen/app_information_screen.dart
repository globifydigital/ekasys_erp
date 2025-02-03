import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/custom_button.dart';


@RoutePage()
class AppInformationScreen extends StatefulWidget {
  const AppInformationScreen({super.key});

  @override
  State<AppInformationScreen> createState() => _AppInformationScreenState();
}

class _AppInformationScreenState extends State<AppInformationScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentSlide = 0;
  CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
  }

  List<String> images = [
    'assets/images/deliveryrobot.png',
    'assets/images/deliveryrobot.png',
    'assets/images/deliveryrobot.png',
  ];

  List<String> texts = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the",
    'Second image description',
    'Third image description',
  ];
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight * 1,
          width: screenWidth * 1,
          child: Stack(
            children: [
              Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 1.0),
                      end: Offset(0.0, 0.0),
                    ).animate(_animationController),
                    child: Assets.images.ekasyslogo1.image(height: screenHeight * 0.05),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(images[index],height: screenHeight * 0.4,),
                            SizedBox(height: 10),
                            Text(texts[index],
                              style: TextStyle(fontSize: 15,),
                              maxLines: 5,
                            ),
                            CustomButton(
                              title: "Next",
                              showActions: false,
                              onPressed: () {
                                if(_currentSlide == 2){
                                  context.router.replace(const URLEnteringRoute());
                                }else{
                                  _carouselController.nextPage();
                                }

                              },
                            )
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.bounceIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentSlide = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.router.replace(const URLEnteringRoute());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text(
                            "Skip >",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
              Positioned(
                bottom: screenHeight * 0.05,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Container(
                      width: _currentSlide == index  ? 15.0 : 6.0,
                      height: 6.0,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentSlide == index ? Colors.black54 : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
          ]
          ),
        ),
      )
    );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
