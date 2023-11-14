



import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
   NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
 child: ListView(children: [ UserAccountsDrawerHeader(accountName: Text('Prashant Singh '), accountEmail: Text('singhprashant79072@gmail.com'),currentAccountPicture: CircleAvatar(),)])
    );
        
    
  }
}