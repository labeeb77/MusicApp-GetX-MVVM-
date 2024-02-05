import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzic/common/color_extension.dart';
import 'package:muzic/view/home/home_view.dart';
import 'package:muzic/view/settings/settings_view.dart';
import 'package:muzic/view/songs/song_view.dart';
import 'package:muzic/view_model/splash_vm.dart';
import 'package:muzic/widget/icon_text_row.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController?.addListener(() {
      selectedTab = tabController?.index ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var splashVM = Get.find<SplashViewModel>();

    return Scaffold(
      key: splashVM.scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xff10121D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 240,
              child: DrawerHeader(
                decoration:
                    BoxDecoration(color: TColor.primaryText.withOpacity(0.03)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/app_logo.png',
                      width: media.width * 0.17,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "344\nSongs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "123\nAlbums",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "344\nArtists",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffC1C0C0), fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
           IconTextRow(title: 'Themes', icon:  'assets/img/m_theme.png', onTap:() => splashVM.closeDrawer(),),
           IconTextRow(title: 'Ringtone Cutter', icon:  'assets/img/m_ring_cut.png', onTap:() => splashVM.closeDrawer(),),
           IconTextRow(title: 'Sleep Timer', icon:  'assets/img/m_sleep_timer.png', onTap:() => splashVM.closeDrawer(),),
           IconTextRow(title: 'Equliser', icon:    'assets/img/m_eq.png', onTap:() => splashVM.closeDrawer(),),
           IconTextRow(title: 'Driver Mode', icon:  'assets/img/m_driver_mode.png', onTap:() => splashVM.closeDrawer(),),
           IconTextRow(title: 'Hidden Folder', icon:  'assets/img/m_hidden_folder.png', onTap:() => splashVM.closeDrawer(),),
            IconTextRow(title: "Scan Media", icon:  'assets/img/m_scan_media.png', onTap:() => splashVM.closeDrawer(),),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        HomeView(),
       SongView(),
        SettingsView()
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: TColor.bg, boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 5, offset: Offset(0, -3))
        ]),
        child: BottomAppBar(
          color: Colors.transparent,
          child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelColor: TColor.primary,
              labelStyle: const TextStyle(fontSize: 10),
              unselectedLabelColor: TColor.primaryText28,
              unselectedLabelStyle: const TextStyle(fontSize: 10),
              tabs: [
                Tab(
                  text: 'Home',
                  icon: Image.asset(
                    selectedTab == 0
                        ? 'assets/img/home_tab.png'
                        : 'assets/img/home_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Tab(
                  text: 'Songs',
                  icon: Image.asset(
                    selectedTab == 1
                        ? 'assets/img/songs_tab.png'
                        : 'assets/img/songs_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Tab(
                  text: 'Settings',
                  icon: Image.asset(
                    selectedTab == 2
                        ? 'assets/img/setting_tab.png'
                        : 'assets/img/setting_tab_un.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
