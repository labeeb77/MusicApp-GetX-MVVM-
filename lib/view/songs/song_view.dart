import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzic/common/color_extension.dart';
import 'package:muzic/view/songs/album_view.dart';
import 'package:muzic/view/songs/allsong_view.dart';
import 'package:muzic/view/songs/artist_view.dart';
import 'package:muzic/view/songs/genres_view.dart';
import 'package:muzic/view/songs/playlist_view.dart';
import 'package:muzic/view_model/splash_vm.dart';

class SongView extends StatefulWidget {
  const SongView({super.key});

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectedTab = controller?.index ?? 0;
      setState(() {});
    });
  }

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
          "Songs",
          style: TextStyle(
              color: TColor.primaryText80, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<SplashViewModel>().openDrawer();
              },
              icon: Image.asset(
                'assets/img/search.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
                color: TColor.primaryText35,
              )),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: kTextTabBarHeight - 15,
            child: TabBar(
                controller: controller,
                indicatorColor: TColor.focus,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelColor: TColor.focus,
                labelStyle: TextStyle(
                    color: TColor.focus,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                    color: TColor.primaryText80,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(
                    text: 'All Songs',
                    height: 25,
                  ),
                  Tab(
                    text: 'Playlist',
                    height: 25,
                  ),
                  Tab(
                    text: 'Albums',
                    height: 25,
                  ),
                  Tab(
                    text: 'Artists',
                    height: 25,
                  ),
                  Tab(
                    text: 'Genres',
                    height: 25,
                  )
                ]),
          ),
          Expanded(
              child: TabBarView(controller: controller, children: const [
            AllSongsView(),
            PlaylistView(),
            AlbumView(),
            ArtistsView(),
            GenresView()
          ]))
        ],
      ),
    );
  }
}
