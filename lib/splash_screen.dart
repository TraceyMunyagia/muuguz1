
import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            AnimatedPositioned(
              bottom: animate ? 250:0,
              left: 50,
              duration: const Duration(milliseconds: 1000),
              child:AnimatedOpacity(
              opacity: animate ? 1:0,
              duration: const Duration(milliseconds: 1000),
              child: Image(image: AssetImage('assets/images/screen2.png')),
            ), 
            ),  
          ],
        ),
      );
  }
  Future startAnimation()async{  
    await Future.delayed( Duration(milliseconds: 500));
    setState(() => animate = true);
     await Future.delayed( Duration(milliseconds: 2500));
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()));

  }
}