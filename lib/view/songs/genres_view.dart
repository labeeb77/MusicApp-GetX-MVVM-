import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:muzic/view_model/genres_vm.dart';
import 'package:muzic/widget/genre_cell.dart';

class GenresView extends StatefulWidget {
  const GenresView({super.key});

  @override
  State<GenresView> createState() => _GenresViewState();
}

class _GenresViewState extends State<GenresView> {
  final genVM = Get.put(GenresViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.4,
            crossAxisCount: 2),
        itemCount: genVM.allList.length,
        itemBuilder: (context, index) {
          var cObj = genVM.allList[index];
          return GenreCell(cObj: cObj, onPressed: () {});
        },
      ),
    );
  }
}
