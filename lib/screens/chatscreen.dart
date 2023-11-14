import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  
  final _messageController = TextEditingController();

  @override
  void dispose()
  { _messageController.dispose();
    super.dispose();
  }
  Future<void> submitmessage()
  async {
  final enteredmeassage = _messageController.text;

  if(enteredmeassage.trim().isEmpty)
  {
    return;
  }
  final user = FirebaseAuth.instance.currentUser!;
  final userdata = await  FirebaseFirestore.instance.collection('user').doc(user.uid).get();
  FirebaseFirestore.instance.collection('chat').add({
    'text':enteredmeassage,
    'createdAt':Timestamp.now(),
    'userID': user.uid,
    'username':userdata.data()!['username'],
    'userimage':userdata.data()!['image_url']
  });
  _messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(padding: const EdgeInsets.only(left: 15,right: 1,bottom: 14),
      child: Row(
        children: [
          const Expanded(child: TextField(
            autocorrect: true,
            enableSuggestions: true,
            decoration:InputDecoration(labelText: 'type something'),
          )),
          IconButton(onPressed:submitmessage, icon: const Icon(Icons.send),color: Theme.of(context).colorScheme.primary,)
        ],
      ),),
    );
  }
}