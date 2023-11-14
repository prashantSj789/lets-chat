

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lets_chat/screens/animation.dart';
import 'package:lets_chat/screens/chatsscreen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lets_chat/screens/welcomescreen.dart';

void main() async{
   
 
  runApp( const MyApp()) ;
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

 
}
 final theme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(189, 10, 160, 189),
    background: const Color.fromARGB(250, 249, 250, 250),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
   appBarTheme: const AppBarTheme(
       iconTheme: IconThemeData(color: Colors.black),
       color: Color.fromARGB(189, 10, 160, 189)),
 );
 class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: theme,
     home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx,snapshot) {
      if (snapshot.connectionState==ConnectionState.waiting) {
        return const AnimationScreen();
        
      }
      if (snapshot.hasData) {
        return const Stack(children: [AnimationScreen(),
          ChatsScreen(),]);
      }
      else {
        return const Welcomepage();
      }
     }
  
    ,
    ));
  }
}
