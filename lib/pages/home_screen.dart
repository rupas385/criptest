import 'package:criptest/pages/selectcharacter_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:criptest/pages/favorites_screen.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage = 0;
  final pages = [SelectCharacterScreen(),FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xfffbb448), Color(0xfff7892b)]
        ),
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.star, title: "Favoritos"),
        ],
        initialActiveIndex: 0,
        onTap: (int index){
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }


}

