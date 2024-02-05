
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzic/common/color_extension.dart';
import 'package:muzic/view_model/album_vm.dart';
import 'package:muzic/view_model/splash_vm.dart';
import 'package:muzic/widget/album_songs_row.dart';

class AlbumDetailsView extends StatefulWidget {
  const AlbumDetailsView({super.key});

  @override
  State<AlbumDetailsView> createState() => _AlbumDetailsViewState();
}

class _AlbumDetailsViewState extends State<AlbumDetailsView>
    {
      final albumVM = Get.put(AlbumViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.bg,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                'assets/img/back.png',
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              )),
          title: Text(
            "Album Details",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Image.asset(
                          'assets/img/alb_1.png',
                          width: double.maxFinite,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black54,
                      width: double.maxFinite,
                      height: media.width * 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/img/alb_1.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "History",
                                    style: TextStyle(
                                        color:
                                            TColor.primaryText.withOpacity(0.9),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "by Michael Jackson",
                                    style: TextStyle(
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "1996 . 18 Songs . 64 min",
                                    style: TextStyle(
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(17.5),
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: 70,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: TColor.primaryG,
                                    begin: Alignment.topCenter,end: Alignment.center),
                                    borderRadius: BorderRadius.circular(17.5)
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/img/play_n.png',
                                      width: 13,
                                      height: 13,
                                      fit: BoxFit.contain,),

                                      const SizedBox(width: 8,),
                                       Text(
                                    "Play",
                                    style: TextStyle(
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10),
                                  ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(17.5),
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: 70,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.5),
                                   border: Border.all(color: TColor.primaryText,width: 1)
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/img/share.png',
                                      width: 13,
                                      height: 13,
                                      fit: BoxFit.contain,),

                                      const SizedBox(width: 8,),
                                       Text(
                                    "Share",
                                    style: TextStyle(
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10),
                                  ),
                                    ],
                                  ),
                                ),
                              ),
                               InkWell(
                                borderRadius: BorderRadius.circular(17.5),
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: 120,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.5),
                                   border: Border.all(color: TColor.primaryText,width: 1)
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/img/fav.png',
                                      width: 13,
                                      height: 13,
                                      fit: BoxFit.contain,
                                      color: TColor.primaryText,),

                                      const SizedBox(width: 8,),
                                       Text(
                                    "Add to favorites",
                                    style: TextStyle(
                                        color: TColor.primaryText
                                            .withOpacity(0.74),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10),
                                  ),
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          )
                        ],

                      ),
                    )
                  ],
                )
    ,
     ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: albumVM.playedArr.length,
              itemBuilder: (context, index) {
                final sObj = albumVM.playedArr[index];
                return AlbumSongsRow(
                  sObj: sObj,
                  onPressed: () {},
                  onPressedPlay: () {},
                  isPlay: index == 0,
                );
              },
            ),
              ],
            ),
          ),
        ));
  }
}
