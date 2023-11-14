import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/screens/animation.dart';
import 'package:lets_chat/screens/chatsscreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailcontroller;
 late TextEditingController _passwordcontroller;
 late TextEditingController _usernamecontroller;
 var isLogin = false;
 var _enteredemail='';
 var _enteredpass='';

 void submit() async
 {
  _enteredemail=_emailcontroller.text;
  _enteredpass=_passwordcontroller.text;

  if(isLogin)
  {

  }
  else
  { 
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _enteredemail, password:_enteredpass);
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const AnimationScreen()));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const ChatsScreen()));
     
   
      
     
    }  on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.code)));
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
        title: Text('Register through your phone no',style:Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ) ,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailcontroller,
                decoration: const InputDecoration(labelText: 'email'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            
              ),
              
              
              TextField( controller: _passwordcontroller,
                decoration: const InputDecoration(labelText: 'Password'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              
              
                 const SizedBox(height: 10,),
              ElevatedButton(onPressed: submit, child: const Text('register')) ,
      
            ],
          ),
        ),
      ),
    );
  }
}