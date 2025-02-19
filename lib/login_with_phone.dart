import 'package:flutter/material.dart';
import 'authentication_repository.dart';
import 'package:get/get.dart';



class Loginwithphone extends StatefulWidget {
  Loginwithphone({super.key});

  @override
  State<Loginwithphone> createState() => _LoginwithphoneState();
}

class _LoginwithphoneState extends State<Loginwithphone> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   String? phoneNo;

   void loginUser() {
  if (_formKey.currentState?.validate() ?? false) {
    _formKey.currentState?.save();

    if (phoneNo != null && phoneNo!.isNotEmpty) {
      AuthenticationRepository.instance.phoneAuthentication(
        phoneNo!,
        );
    } else {
      Get.snackbar("Error", "Please enter a valid phone number");
    }
  }
}

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
          Image(image:AssetImage('assets/images/screen2.png')),
          Text('Login to your account using phone number', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center,),
            /* --end of Section-1 --*/
            SizedBox(height: 20),
            /* --Section-2 --*/
            Form(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                TextFormField(
                   decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                ],
       ),
    ),
    SizedBox(height: 20),
     SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                 onPressed: loginUser,
                  style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                 child: Text('Get OTP', style: TextStyle(fontSize: 18, color: Colors.white)),
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