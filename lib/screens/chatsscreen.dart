import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lets_chat/screens/chatscreen.dart';
import 'package:lets_chat/screens/navbar.dart';
import 'package:lets_chat/widgets/userlist.dart';


class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatsScreen> with TickerProviderStateMixin {
  
 
   static const List<Tab> myTabs = <Tab>[
     Tab(text:'chats',icon: Icon(Icons.message),),
        Tab(text: 'status',icon: Icon(Icons.picture_in_picture),),
        Tab(text: 'calls',icon: Icon(Icons.call),)
  ];
   late final TabController _tabController;
   @override
    void initState() {
    super.initState();
    _tabController = TabController(vsync:this, length: myTabs.length,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NavBar() ,
      appBar: AppBar(title:const Text('lets chat'),
      
      actions: [IconButton(onPressed: (){},icon: const Icon(Icons.camera,)),
      IconButton(onPressed: () {},icon: const Icon(Icons.search),)],
      bottom:  TabBar(controller: _tabController,
        tabs: myTabs,
      ),), 
      body:  Column(
        children: [
         
          
        ],
      ),

    );
}
}