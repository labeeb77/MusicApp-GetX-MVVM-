import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzic/view_model/playlist_vm.dart';
import 'package:muzic/widget/my_playlist_cell.dart';
import 'package:muzic/widget/playlist_songs_cell.dart';
import 'package:muzic/widget/view_all_section.dart';

class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {

   final plVM = Get.put(PlaylistsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff23273B),
        onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset('assets/img/add.png'),
      ),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
                itemCount: plVM.playlistArr.length,
               itemBuilder: (context, index) {
                 var pObj = plVM.playlistArr[index];
                 return PlaylistSongsCell(
                  pObj: pObj,
                   onPressed: (){},
                    onPressedPlay: (){});
               },)),



            ViewAllSection(title: 'My Playlists', onPressed: (){}),
            SizedBox(
              height: 150,
              child: Obx(() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: plVM.myPlaylistArr.length,
        itemBuilder: (context, index) {
        var pObj = plVM.myPlaylistArr[index];

        return MyPlaylistCell(pObj: pObj, onPressed: (){});
      },)),
            )
          ],
        ),
      ),
    );
  }
}