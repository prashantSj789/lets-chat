import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>with SingleTickerProviderStateMixin {
  
   late   AnimationController _controller;
   @override
   void initState()
   {
    _controller=AnimationController(vsync: this,
    duration: const Duration(seconds: 2));

   }
   @override
   void dispose(){
  _controller.dispose();
  super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Lottie.network('https://lottie.host/2e9a9c49-886c-4e58-991f-0e5cc14333d8/L7gmUe6MCd.json')
      ),
    );
  }
}

