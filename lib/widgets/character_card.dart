import 'package:criptest/models/amongus_character.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {

  final AmongUsCharacter character;
   CharacterCard({Key key,this.character}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color(int.parse(character.hexColor))
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/${character.image}',width: 100,),
            Text(character.name)
          ],
        ),
      )
    );
  }
}
