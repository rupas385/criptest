import 'package:criptest/service/data_service.dart';
import 'package:criptest/models/amongus_character.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersController extends GetxController{

  final DataService dataService;
  CharactersController({@required this.dataService}) : assert(dataService != null);
  List characters;
  var favorites = <AmongUsCharacter>[].obs;


  @override
  void onReady() async {
    super.onReady();
    await loadData();
  }

  loadData() async{
    characters = await dataService.getCharacters();
    print(characters.toString());
    update();
  }

  onFavoriteSelected(AmongUsCharacter character){

    if (favorites.contains(character)){
      favorites.remove(character);
      favorites.add(character);
    }else
      favorites.add(character);

    update();
  }

}