// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'), 
        backgroundColor: Theme.of(context).colorScheme.surface,

        actions: [
          IconButton(
            onPressed: logout, 
            icon: Icon(Icons.logout)
            )
          ],
        
        ),
      drawer: Drawer( 
        child:Column(
        children: [
            //drawer header
            DrawerHeader(child: Icon(Icons.landscape_outlined, size: 60,), ),
            //home tile
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: TextStyle(fontSize: 20)),
              
              ),
        ],
      )),
    );
    
  }
}
