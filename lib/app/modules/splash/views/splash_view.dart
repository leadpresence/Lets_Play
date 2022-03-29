import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/controllers/splash_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/mobile/splash_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/tablet/splash_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/tablet/splash_tablet_potrait.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'mobile/splash_mobile_landscape.dart';

class SplashView extends GetView<SplashController>{
   const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        
        portrait: (_)=> const SplashMobilePotrait(),
        landscape: (_)=>const SplashMobileLandscape(), 
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) => const SplashTabletPotrait(),
          landscape: (_)=>
          const SplashTabletLandscape(),
          
          ),
    
    );
  }}