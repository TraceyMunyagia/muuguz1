import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image:AssetImage('assets/images/screen2.png')),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Welcome to Muuguzi', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center,
),
                Text('Kindly sign up or login to get started', style: TextStyle(fontSize: 18, color: Colors.blueAccent),  textAlign: TextAlign.center,
),
              ],
            ),
            Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
                child:OutlinedButton(
                onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));

                }, 
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                )
                ), 
              const SizedBox(width: 10.0),
              Expanded(
                child:OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));

                  }, 
                   style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                  child: Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  ), 
              ],
            ),
            
            ],
            )

          ],
        )
      )
    );
  }
}