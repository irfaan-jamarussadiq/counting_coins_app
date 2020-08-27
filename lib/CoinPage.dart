import 'package:flutter/material.dart';
import 'Coin.dart';
import 'Penny.dart';
import 'TextButton.dart';

class CoinPage {
  TextButton _button;
  Image _image;

  CoinPage(Coin coin) {
    String coinType = coin.runtimeType.toString();
    String desc1 = 'This is a ' + coinType.toLowerCase() + '.';
    String desc2 = 'It costs ' + coin.getValue().toString() + ' cent';
    desc2 += (coin.getValue() == 1) ? '.' : 's.';
    String imageFileName = 'images/' + coinType.toLowerCase() + '.png';

    _button = TextButton(coinType + 'Description.mp3', desc1 + '\n' + desc2);
    _image = Image.asset(imageFileName);
  }

  Container createCoinPage() {
    return Container(
      child: Column(
          children: [
            SizedBox(height: 40),
            _button.createDescriptionButton(40),
            Expanded(child: _image),
          ]
      ),
    );
  }
}
