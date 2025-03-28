

import 'package:flutter/material.dart';
import 'package:quizzer/screens/history_screen.dart';
import 'package:quizzer/screens/home_screen.dart';
import 'package:quizzer/screens/prepare_screen.dart';
import 'package:quizzer/screens/profile_screen.dart';

class Tabs extends StatefulWidget{
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs>{

  int _currentScreenIndex = 0;

  void _setIndex(int index){
    setState(() {
      _currentScreenIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
      Widget _activeScreen = const HomeScreen();
    if(_currentScreenIndex == 1){
      _activeScreen = PrepareScreen();
    }
    if(_currentScreenIndex == 2){
      _activeScreen = HistoryScreen();
    }
    if(_currentScreenIndex == 3){
      _activeScreen = ProfileScreen();
    }

    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Quizzer",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          letterSpacing: 3,
        ),),
        toolbarHeight: 80.0,
      ),
      body: _activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (currIndex){
          _setIndex(currIndex);
        },
        iconSize: 30,selectedItemColor: Colors.amberAccent[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.deepPurple,),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp),label: "Prepare",backgroundColor: Colors.deepPurple,),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "History",backgroundColor: Colors.deepPurple,),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile",backgroundColor: Colors.deepPurple,),
        ])
    );
  }
}