import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/amongus_character.dart';



class DataService extends GetxService{

  String url = 'https://drive.google.com/uc?export=download&id=1sG0kuxQNBUHsbTY3PkXTnBYgDVhBblgA';

  Future<List> getCharacters() async{
    var response = await http.get(Uri.parse(url));
    var characters = [];

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      print(response.body);
      characters = jsonResponse.map((e) => AmongUsCharacter.fromJson(e)).toList();

      print(characters.toString());
    }

    return characters;
  }


}