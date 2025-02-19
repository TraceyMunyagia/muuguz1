import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
child: Scaffold(
       appBar: AppBar(
        title: Text('Your Profile', textAlign: TextAlign.center,),
        backgroundColor: Colors.blue,
        ),
        body: Container(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           ElevatedButton(
            onPressed: () {
            Get.find<AuthenticationRepository>().logout();
            }, 
            child: Text("Logout"),
            ),
          ],
          )
        ),
    )
    
    );
  }
}