import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
          slideIconWidget: Icon(Icons.arrow_back_ios_rounded),
          enableSideReveal: true,
            pages: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.greenAccent,
                child:Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Image(image: AssetImage('assets/images/nurse3.jpg')),
                    Column(
                      children: [
                        Text('Looking for a job?', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.blue)),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                  )
                ),
                 Container(
                padding: EdgeInsets.all(20),
                color: Colors.pinkAccent,
                child:Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Image(image: AssetImage('assets/images/elder2.jpg'), height: size.height * 0.5),
                    Column(
                      children: [
                        Text('Looking for a caregiver?', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.blue)),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],)
                ),
          
            ],
          ),

        ],
      ),
     
    );
  }
}