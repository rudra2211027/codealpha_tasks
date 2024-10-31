import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Workout Stats',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),),
              SizedBox(width: 8,),
              Icon(Icons.pie_chart_outline_rounded,size: 20,
              color: Color(0xff3bc6fa),),
            ],
          ),
          SizedBox(height: 15,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 30,),
                InfoStat(
                    icon: Icons.timer,
                    iconColor: Color(0xff535bed),
                    iconBackground: Color(0xffe4e7ff),
                    time: '+5s',
                    label: 'Time',
                    value: '30:35'),
                SizedBox(width: 15,),
                InfoStat(
                    icon: Icons.favorite_outline,
                    iconColor: Color(0xffe11e6c),
                    iconBackground: Color(0xffffe4fb),
                    time: '+5s',
                    label: 'Heart Rate',
                    value: '151bpm'),
                SizedBox(width: 15,),
                InfoStat(
                    icon: Icons.bolt,
                    iconColor: Color(0xffd3b50f),
                    iconBackground: Color(0xfffb4be4),
                    time: '+5s',
                    label: 'Energy',
                    value: '169Kcal'),
                SizedBox(width: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class InfoStat extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String time;
  final String label;
  final String value;
  const InfoStat({super.key, required this.icon, required this.iconColor, required this.iconBackground, required this.time, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical:5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xffe1e1e1),
        ),
        boxShadow: [
          BoxShadow(
          color: Colors.black12,
          offset: Offset(3, 3),
          blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(15),),

      child: Stack(
        children: [
          StatIcon(
            icon:icon,
            iconColor: iconColor,
            iconBackground: iconBackground,
          ),
          Change(time:time),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,style: TextStyle(fontSize: 10),),
                Text(value,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w800),),
              ],
            ),
          )
        ],

      ),
    );
  }
}

class StatIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  const StatIcon({super.key,required this.icon, required this.iconColor, required this.iconBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
        decoration:BoxDecoration(
      color: iconBackground,
      borderRadius: BorderRadius.circular(9),
    ),child: Icon(icon,size: 15,color: iconColor,));
  }
}

class Change extends StatelessWidget {
  const Change({super.key,required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text('Time',style: TextStyle(
          fontSize: 10,
          color: Colors.white
        ),),
      ),
    );
  }
}
