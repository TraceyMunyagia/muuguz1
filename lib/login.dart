import 'package:flutter/material.dart';
import 'forget_password_mail.dart';
import 'signup.dart';
import 'package:get/get.dart';
import 'forget_password_phone.dart';
import 'login_with_phone.dart';
import 'authentication_repository.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   String? email;
   String? password;

  void loginUser() {
  // Validate and save form fields
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    // Check if email and password are provided
    if (email != null && password != null) {
      AuthenticationRepository.instance.loginWithEmailandPassword(
        email!,
        password!,
      );
    } else {
      Get.snackbar("Error", "Please enter your email and password");
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
          Text('Login to your account', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center,),
            /* --end of Section-1 --*/
            SizedBox(height: 20),
            /* --Section-2 --*/
            Form(
              key: _formKey,
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
                  onSaved: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      builder: (context) => Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Make a Selection',style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color: Colors.blueAccent, ),  textAlign: TextAlign.center ,),
                            Text('Select one of the options given below to reset your password.',style: TextStyle(fontSize: 14,  color: Colors.blueAccent, ),  textAlign: TextAlign.left ,),
                            const SizedBox(height: 20.0,),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Get.to(()=> ForgetPasswordMail());},
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('E-Mail',style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.white, ),),
                                    Text('Reset via E-Mail Verification',style: TextStyle(fontSize: 14,  color: Colors.white, ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0,),
                            GestureDetector( 
                              onTap: () {
                                Navigator.pop(context);
                                Get.to(()=> ForgetPasswordPhone());
                              },
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone',style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.white, ),),
                                    Text('Reset via OTP Verification',style: TextStyle(fontSize: 14,  color: Colors.white, ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, child: Text('Forgot password?',style: TextStyle(fontSize: 18, color: Colors.blue))),
                ),
                SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                 onPressed: loginUser,
                  style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                 child: Text('LOGIN', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                ),


              ],
              ),
              ),
              SizedBox(height: 20),
               Column(
                children: [
                  TextButton(
                    onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginwithphone()));
                    },
                    child:Text('Login with phone number',style: TextStyle(fontSize: 18, color: Colors.blue)),
                    ),
                ],
                  ), 
              /* --end of Section-2 --*/
              SizedBox(height: 20),
              /* --Section-3 --*/
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                }, 
                child: Text.rich(
                  TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.redAccent),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                ),
                ),
              ]
              ),

          ]

        ),
        ),
      )
    ),
    );
  }
}