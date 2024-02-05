import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muzic/common/color_extension.dart';
import 'package:muzic/view_model/splash_vm.dart';
import 'package:muzic/widget/icon_text_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
            },
            icon: Image.asset(
              'assets/img/menu.png',
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            )),
        title: Text(
          "Settings",
          style: TextStyle(
              color: TColor.primaryText80, fontWeight: FontWeight.w600),
        ),
        
       
      ),
      body: ListView(
        children: [
          IconTextRow(title: 'Display', icon: 'assets/img/s_display.png', onTap: (){}),
          IconTextRow(title: 'Audio', icon: 'assets/img/s_audio.png', onTap: (){}),
          IconTextRow(title: 'Headset', icon: 'assets/img/s_headset.png', onTap: (){}),
          IconTextRow(title: 'Lock Screen', icon: 'assets/img/s_lock_screen.png', onTap: (){}),
          IconTextRow(title: 'Advanced', icon: 'assets/img/s_menu.png', onTap: (){}),
          IconTextRow(title: 'Other', icon: 'assets/img/s_other.png', onTap: (){})
        ],
      ),
    );
  }
}