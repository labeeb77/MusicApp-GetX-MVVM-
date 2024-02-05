import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:muzic/view/main_tabview/main_tabview.dart';

class SplashViewModel extends GetxController{

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void loadView()async{
    await Future.delayed(const Duration(seconds: 3));
    Get.to(()=> MainTabView());
  }

  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer(){
    scaffoldKey.currentState?.closeDrawer();
  }
}