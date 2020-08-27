import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'Dime.dart';
import 'ExercisePage.dart';
import 'HomePage.dart';
import 'Nickel.dart';
import 'Penny.dart';
import 'CoinPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'Quarter.dart';

void main() => runApp(new PageDemo());

class PageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Page Demo', home: SamplePage());
  }
}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<Widget> _samplePages = [
    //TODO: Change HomePage to make it not fail on build method.
    HomeScreen(),
    CoinPage(Penny()).createCoinPage(),
    ExercisePage(10, 0, 0, 0, 'Exercise1.mp3', 'Let\'s count some pennies!','How many coins do you see?', '10',
    'Question1.mp3').createExercisePage(),
    CoinPage(Nickel()).createCoinPage(),
    CoinPage(Dime()).createCoinPage(),
    CoinPage(Quarter()).createCoinPage(),
    ExercisePage(5, 5, 2, 0, 'Exercise1.mp3', 'Let\'s count some more coins!','How many cents do you see?', '50',
    'Question2.mp3').createExercisePage(),
  ];
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView.builder(
                controller: _controller,
                itemCount: _samplePages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _samplePages[index % _samplePages.length];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}