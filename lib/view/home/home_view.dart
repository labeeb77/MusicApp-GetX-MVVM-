import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:muzic/common/color_extension.dart';
import 'package:muzic/view_model/home_vm.dart';
import 'package:muzic/view_model/splash_vm.dart';
import 'package:muzic/widget/playlist_cell.dart';
import 'package:muzic/widget/recommended_cell.dart';
import 'package:muzic/widget/songs_row.dart';
import 'package:muzic/widget/title_section.dart';
import 'package:muzic/widget/view_all_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());

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
        title: Row(
          children: [
            Expanded(
                child: Container(
              height: 38,
              decoration: BoxDecoration(
                  color: Color(0xff292E4B),
                  borderRadius: BorderRadius.circular(19)),
              child: TextField(
                controller: homeVM.textSearch.value,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 30,
                      child: Image.asset(
                        'assets/img/search.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                        color: TColor.primaryText28,
                      ),
                    ),
                    hintText: 'Search album songs',
                    hintStyle:
                        TextStyle(color: TColor.primaryText28, fontSize: 13)),
              ),
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(title: 'Hot Recommended'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                scrollDirection: Axis.horizontal,
                itemCount: homeVM.hostRecommendedArr.length,
                itemBuilder: (context, index) {
                  final mObj = homeVM.hostRecommendedArr[index];
                  return RecommendedCell(mObj: mObj);
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(title: "Playlist", onPressed: () {}),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: homeVM.playListArr.length,
                itemBuilder: (context, index) {
                  final mObj = homeVM.playListArr[index];
                  return PlaylistCell(mObj: mObj);
                },
              ),
            ),
             Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(title: "Recently Played", onPressed: () {}),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeVM.recentlyPlayedArr.length,
              itemBuilder: (context, index) {
                final sObj = homeVM.recentlyPlayedArr[index];
                return SongsRow(
                  sObj: sObj,
                  onPressed: () {},
                  onPressedPlay: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
