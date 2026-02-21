import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../../../../core/constant/assets_names.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: ScaleTransition(
            scale: controller.animation,
            child: Image.asset(
              height: 200,
              width: 200,
              AssetsNames.appLogo, 
            ),
          ),
        ),
      );
}
