import 'package:flutter/material.dart';
import 'package:myfitness/pages/details/widgets/Stats.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Stats(value: '345',unit: 'Kcal',label: 'Calories',),
        Stats(value: '3.6',unit: 'Km',label: 'Distance',),
        Stats(value: '1.5',unit: 'hr',label: 'Hours',),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const Stats({
    super.key,
    required this.value,
    required this.unit,
    required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),
          children: [
            TextSpan(text: ''),
            TextSpan(
              text: unit,
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)
            )
          ]),
        ),

        SizedBox(height: 6,),

        Text(label,
        style: TextStyle(
        fontSize: 10,
    fontWeight: FontWeight.w500
    ),),
      ],
    );
  }
}
