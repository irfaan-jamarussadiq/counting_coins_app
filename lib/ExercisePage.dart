import 'package:flutter/material.dart';

import 'Coin.dart';
import 'Dime.dart';
import 'Nickel.dart';
import 'Penny.dart';
import 'Quarter.dart';
import 'Question.dart';
import 'TextButton.dart';

class ExercisePage {
  TextButton _button;
  Question _question;
  List<Coin> _coinList = List<Coin>();

  ExercisePage(int pennies, int nickels, int dimes, int quarters,
      String audioFileName, String description, String question, String answer,
      String questionAudioFileName) {
    this._button = TextButton(audioFileName, description);
    this._question = Question(question, answer, questionAudioFileName);
    this._coinList = createCoinList(pennies, nickels, dimes, quarters);
  }

  List<Coin> createCoinList(int pennies, int nickels, int dimes, int quarters) {
    List<Coin> penniesList = List.generate(pennies, (index) => Penny());
    List<Coin> nickelsList = List.generate(nickels, (index) => Nickel());
    List<Coin> dimesList = List.generate(dimes, (index) => Dime());
    List<Coin> quartersList = List.generate(quarters, (index) => Quarter());

    _coinList.addAll(penniesList);
    _coinList.addAll(nickelsList);
    _coinList.addAll(dimesList);
    _coinList.addAll(quartersList);
    return _coinList;
  }

  GridView createCoinListView(int rowCount) {
    List<Container> views = List<Container>();
    for (Coin coin in _coinList) {
      String coinType = coin.runtimeType.toString().toLowerCase();
      Image image = Image.asset('images/' + coinType + '.png');
      views.add(Container(child: image));
    }

    return GridView.count(
      crossAxisCount: rowCount,
      children: views,
    );
  }

  Container createExercisePage() {
    return Container(
      child: Column(
        children: [
          _button.createDescriptionButton(30),
          SizedBox(height: 20),
          Container(
            child: Expanded(
                child: createCoinListView(5),
            ),
          ),
          TextButton(_question.questionAudioFileName, _question.questionText).createDescriptionButton(20),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.attach_money),
              hintText: 'Enter a number!',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
              //TODO: Give some signal here about right/wrong answer.
            },
            validator: (String value) {
              return (value == _question.questionAnswer) ? 'correct!' : 'wrong';
            },
          )
        ],
      ),
    );
  }

}