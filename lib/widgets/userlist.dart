import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class usercontroller extends StatefulWidget {
  const usercontroller({super.key});

  @override
  State<usercontroller> createState() => _usercontrollerState();
}

class _usercontrollerState extends State<usercontroller> {
  bool isLoading = true;
  final auth = FirebaseAuth.instance;
    @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}