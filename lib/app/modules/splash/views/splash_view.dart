import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  bool _showFullText = false;
  bool  _showAnotherText = false;
  bool _moveIcon = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1400), () {
      setState(() {
        _showFullText = true;
      });
    });


    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _moveIcon = true;
        Future.delayed(Duration(milliseconds: 1200));
        _showAnotherText = true;
      });
    });


    Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 110,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Logo Text (Initially hidden)
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn,
                ),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _showFullText ? 1 : 0,
                  child: Image.asset(
                    'assets/images/halfIcon.png',
                    height: 40,
                  ),
                ),
              ),

              // Icon that moves
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                right: _moveIcon ? width * -0.07 : 80,
                top: 25,
                left: 50,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 45,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                top: height * 0.1,

                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Get.isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity:  _showAnotherText ? 1 : 0,
                    child: Text("Fitness")
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
