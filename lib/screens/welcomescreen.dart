import 'package:flutter/material.dart';
import 'package:lets_chat/screens/login.dart';
import 'package:lets_chat/screens/registerscreen.dart';
class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(child: Image.asset('assets/images/3394897.png'),),
          ),
          Expanded(child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Column(children: [
              Text('welcome to lets chat',style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,) ,),
                  
            Expanded(
              
                child: Row(
                  children: [
                   ElevatedButton(onPressed: ()
                   {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const loginscreen()));
                   }, child: const Text('login')) ,
                   const SizedBox(width: 15,),
                   TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RegisterScreen() ));
                   }, child: const Text('reister'))
                  ],
                ),
              
           )
          
            ],),
          )
          ),
          
        ],
      ),
    );
  }
}