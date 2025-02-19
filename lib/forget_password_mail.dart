import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_screen.dart';


class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body:SingleChildScrollView(
      
      child:Container(
       padding: EdgeInsets.all(20),
       child: Column(
        children: [
         Image(image:AssetImage('assets/images/forgot_password.png')),
         Text('Forgotten Password!', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center,),
          Text('Enter your email address to recieve link to reset password.',style: TextStyle(fontSize: 14,  color: Colors.blueAccent, ),  textAlign: TextAlign.center ,),
               /* --Section-1 --*/
          const SizedBox(height: 20),
               
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
                                ],
                              ),
                            ),
                const SizedBox(height: 20),
                SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                 onPressed: () {
                  Get.to(()=> Otp());
                 },
                  style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                 child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                ),
                          ],
                          
                        ),
                      ),
                      
                    ),
      ),
    );
                  }
                }
           