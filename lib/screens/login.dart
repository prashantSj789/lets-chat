

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lets_chat/screens/animation.dart';
import 'package:lets_chat/screens/chatsscreen.dart';

final _firebase = FirebaseAuth.instance;
class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

 late TextEditingController _emailcontroller;
 late TextEditingController _passwordcontroller;
 var isLogin = true;
 var _enteredemail='';
 var _enteredpass='';
 void submit() async
 {
  _enteredemail=_emailcontroller.text;
  _enteredpass=_passwordcontroller.text;
 
  if(isLogin)
  { try {
    final UserCredential = await _firebase.signInWithEmailAndPassword(email: _enteredemail, password:_enteredpass);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const AnimationScreen()));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const ChatsScreen()));
     print(UserCredential);
  } on  FirebaseAuthException catch (e) {
     ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
  }
   
  }
  
    
  }
  
 
 @override
  void initState() {
    super.initState();
    _emailcontroller = TextEditingController();
    _passwordcontroller=TextEditingController();
  
  }
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
  
  @override
 
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Login in with your email',style:Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,) ,),
      ),
      body: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _emailcontroller,
              decoration: const InputDecoration(labelText: 'email'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _passwordcontroller,
              decoration: const InputDecoration(labelText: 'Password',),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                
                
              ),
              
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed:submit, child: const Text('login')) ,

        ],
      ),)),
    );
  }
}