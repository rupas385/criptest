import 'package:criptest/controllers/charactercontroller.dart';
import 'package:criptest/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hop_swipe_cards/hop_swipe_cards.dart';

class SelectCharacterScreen extends GetWidget<CharactersController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Characters'),
      ),
      body: GetBuilder<CharactersController>(
        builder: (controller){
          if(controller.characters == null || controller.characters.isEmpty)
            return Center(
              child: Text('Not characters loaded!'),
            );
          return Center(
            child: HopSwipeCards(
              noMoreSwipeCardsLeft: Center(child: Text('No more characters')),
              totalNum: controller.characters.length,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.width * 0.9,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              minHeight: MediaQuery.of(context).size.width * 0.8,
              cardBuilder: (context, index, a) => CharacterCard(character: controller.characters[index]),
              swipeCompleteCallback: (int index, direction) {
                if(direction == TriggerDirection.leftOnCard){
                  print('Delete card');
                }else if(direction == TriggerDirection.rightOnCard){
                  print('Favorite card');
                  controller.onFavoriteSelected(controller.characters[index]);
                }
              },
              currentIndexInDisplay: (index) {},
            ),
            );

        },
      ),
    );
  }
}
