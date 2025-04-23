// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/splash_controller.dart';
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:async';
//
// class SplashView extends StatefulWidget {
//   const SplashView({super.key});
//
//   @override
//   SplashViewState createState() => SplashViewState();
// }
//
// class SplashViewState extends State<SplashView> with TickerProviderStateMixin {
//   late AnimationController _iconController;
//   late AnimationController _textController;
//   late Animation<double> _iconAnimation;
//   late Animation<double> _textAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _iconController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//
//     _textController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 800),
//     );
//
//     _iconAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _iconController, curve: Curves.easeIn),
//     );
//
//     _textAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _textController, curve: Curves.easeIn),
//     );
//
//     _iconController.forward().then((_) => _textController.forward());
//
//     // Go to HomeView after delay
//     Timer(Duration(seconds: 3), () {
//       Get.offAllNamed('/home'); // Replace with your HomeView route
//     });
//   }
//
//   @override
//   void dispose() {
//     _iconController.dispose();
//     _textController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeTransition(
//               opacity: _iconAnimation,
//               child: Image.asset('assets/images/icon.png', height: 100),
//             ),
//             SizedBox(height: 20),
//             FadeTransition(
//               opacity: _textAnimation,
//               child: Image.asset('assets/images/logo.png', height: 40),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  bool _showFullText = false;
  bool  _showAnotherText = false;
  bool _moveIcon = false;

  @override
  void initState() {
    super.initState();

    // Phase 1: show icon (default)
    // Phase 2: show text
    Future.delayed(Duration(milliseconds: 1400), () {
      setState(() {
        _showFullText = true;
      });
    });

    // Phase 3: move icon right and align to form logo
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _moveIcon = true;
        Future.delayed(Duration(milliseconds: 1200));
        _showAnotherText = true;
      });
    });

    // After animation, navigate
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
