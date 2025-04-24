import 'package:fitness_app/app/common/app_color_contants.dart';
import 'package:fitness_app/app/common/app_containers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello!', style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            CustomContainer(
              color: context.isDarkMode ? containerColorDarkMode : containerColorLightMode,
              padding: EdgeInsets.all(20),
              borderRadius: 15,
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      Text("Steps: 13112", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),

                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        child: Column(
                          spacing:10,
                          children: [
                            LinearProgressIndicator(
                              value: 10112 / 15000,
                              color: context.isDarkMode ? progressBarColorDarkMode : progressBarColorLightMode,
                              minHeight: 18,
                              backgroundColor: Color(0xc0c4c4c4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("0", style: TextStyle(fontSize: 12, fontWeight:w600,color: Colors.grey)),
                                  Text("Goal: 15000", style: TextStyle(fontSize: 12,fontWeight: w600, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Image.asset("assets/images/ion_footsteps-sharp.png", color: context.isDarkMode ? progressBarColorDarkMode: progressBarColorLightMode,)
                    ],
                  ),


                ],
              ),
            ),
            CustomContainer(
              color: Get.isDarkMode ? containerColorDarkMode : containerColorLightMode,
              padding: EdgeInsets.all(20),
              borderRadius: 15,
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      Text("Calories Burned: 500", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),

                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        child: Column(
                          spacing: 10,
                          children: [
                            LinearProgressIndicator(
                              value: 500 / 1000,
                              color: context.isDarkMode ? progressBarColorDarkMode : progressBarColorLightMode,
                              minHeight: 18,
                              backgroundColor: Color(0xc0c4c4c4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("0", style: TextStyle(fontSize: 12, fontWeight:w600,color: context.isDarkMode ? progressBarColorDarkMode: progressBarColorLightMode)),
                                  Text("Goal: 1000", style: TextStyle(fontSize: 12,fontWeight: w600, color: context.isDarkMode ? progressBarColorDarkMode: progressBarColorLightMode)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Image.asset("assets/images/kcal.png", color: context.isDarkMode ? progressBarColorDarkMode: progressBarColorLightMode,)
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
