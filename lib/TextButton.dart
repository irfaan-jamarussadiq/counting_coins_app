import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class TextButton {
  String _audioFileName;
  String _description;

  TextButton(this._audioFileName, this._description);

  FlatButton createDescriptionButton(double fontSize) {
    return FlatButton(
      onPressed: () => _playSound(_audioFileName),
      child: Text(
        _description,
        style: TextStyle(
          fontFamily: 'OriginalSurfer',
          fontSize: fontSize,
        ),
      ),
    );
  }

  _playSound(String audioFileName) {
    final player = AudioCache();
    player.play(audioFileName);
  }
}