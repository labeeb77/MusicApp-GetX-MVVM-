import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzic/view/songs/album_details_view.dart';
import 'package:muzic/view_model/album_vm.dart';
import 'package:muzic/widget/album_cell.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  final albumVM = Get.put(AlbumViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var cellWidth = (media
    .width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(() => GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: cellWidth / (cellWidth + 50.0) ,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10),
          itemCount: albumVM.allList.length,
         itemBuilder: (context, index) {
           var aObj = albumVM.allList[index];
           return AlbumCell(aObj: aObj, onPressed: (){
            Get.to(AlbumDetailsView());
           },
            onPressedMenu: (selectIndex){
              print(index);

           });
         },)),

    );
  }
}