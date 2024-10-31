import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{

  final AppBar appBar;
  const MainAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Activity',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){},
            child: Icon(Icons.notifications,size: 16,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.deepOrange,


            ),
          )
        ],


      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

