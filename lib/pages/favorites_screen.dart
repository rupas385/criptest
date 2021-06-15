import 'package:criptest/controllers/charactercontroller.dart';
import 'package:criptest/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetWidget<CharactersController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Favorites'),
      ),
      body: GetBuilder<CharactersController>(
        builder: (controller){
          if(controller.favorites == null || controller.favorites.isEmpty)
            return Center(
              child: Text('Not favorites loaded!'),
            );
           return Container(
            child: Center(
              child:  ListView.builder(
                itemBuilder: (context, index){
                  var item = controller.favorites[index];
                  return  CharacterCard(character: item);
                },
                itemCount: controller.favorites.length,
                physics: BouncingScrollPhysics(),
                //children: users.map((user) => LeaderBoardUserCard(userModel: user, index: 0,)).toList(),
              ) ,
            ),
          );

        },
      ),
    );


  }
}
