import 'package:flutter/material.dart';
//import 'package:volume_control/volume_control.dart';

class VolumeSlider extends StatefulWidget {
  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue,
      activeColor: Colors.lightBlue.shade300,
      min: 0,
      max: 100,
      onChanged: (newValue) {
        setState(() {
          sliderValue = newValue;
        });
      },
    );
  }
}