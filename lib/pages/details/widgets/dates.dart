import 'package:flutter/material.dart';
import 'package:myfitness/hellpers.dart';

class Dates extends StatelessWidget {
  const Dates({super.key});

  @override
  Widget build(BuildContext context) {

    List<DateBox> dateBoxes =[];
    //DateTime date= DateTime.parse('2021-11-08');
    DateTime date= DateTime.now().subtract(Duration(days: 3));

    for(int i=0;i<6;i++)
      {
       dateBoxes.add(DateBox(date: date,active:i==3,));
       date= date.add(Duration(days: 1));
      }
    return Padding(      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dateBoxes,
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final DateTime date;

  const DateBox({super.key, this.active=false, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, height: 70,
      decoration: BoxDecoration(
        gradient: active?LinearGradient(colors: [
          Color(0xff92e2ff),
          Color(0xff1ebdf8),
        ],
        begin: Alignment.topCenter
        ) :null,
          border: Border.all(
              color: Color(0xffe1e1e1)),
      borderRadius: BorderRadius.circular(10)),
      child: DefaultTextStyle.merge(
        style: active? TextStyle(color: Colors.white):null,
        child: Column(
          children: [
            Text(daysOfWeek[date.weekday]!,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(date.day.toString().padLeft(2,'0'),style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
          ],
        ),
      ),

    );
  }
}

