import 'package:flutter/material.dart';
import 'package:myfitness/pages/details/widgets/Stats.dart';
import 'package:myfitness/pages/details/widgets/appbar.dart';
import 'package:myfitness/pages/details/widgets/dates.dart';
import 'package:myfitness/pages/details/widgets/graph.dart';
import 'package:myfitness/pages/details/widgets/info.dart' hide Stats;
import 'package:myfitness/pages/details/widgets/steps.dart';
import 'package:myfitness/widgets/bottom_navigation.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(appBar: AppBar(),),
      body: Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Stats(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
