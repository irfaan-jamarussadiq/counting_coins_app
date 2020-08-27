import 'package:flutter/material.dart';
import 'package:pageview_demo/VolumeSlider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final String appFont = 'OriginalSurfer';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text('Back To HomeScreen'),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VolumeSlider mediaPlayer = VolumeSlider(), musicPlayer = VolumeSlider();

  RaisedButton createHomeScreenButton(String text, onPressed) {
    return RaisedButton(
      color: Colors.lightGreenAccent.shade400,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontFamily: appFont,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _showMyDialog() {
      Alert(
        content: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.volume_up,
                  color: Colors.lightBlue.shade300,
                ),
                mediaPlayer,
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.audiotrack,
                  color: Colors.lightBlue.shade300,
                ),
                musicPlayer,
              ],
            ),
          ],
        ),
        style: AlertStyle(
          backgroundColor: Colors.black,
          titleStyle: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        context: context,
        title: "Game Settings",
        buttons: [
          DialogButton(
            color: Colors.black,
            child: Text(
              "Apply",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/homescreen.png'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counting Money',
              style: TextStyle(
                fontFamily: appFont,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            createHomeScreenButton('Play', () {
              //TODO: Navigator.push(context, CoinPage/Page1);
            }),
            createHomeScreenButton('Settings', () {
              _showMyDialog();
            }),
          ],
        ),
      ),
    );
  }
}