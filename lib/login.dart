import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* --Section-1 --*/
          Image(image:AssetImage('assets/images/splash-screen.jpg')),
          Text('Login to your account', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center,),
            /* --end of Section-1 --*/
            SizedBox(height: 20),
            /* --Section-2 --*/
            Form(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
              ),
              ),
          ]

        ),
        ),
      )
    ),
    );
  }
}