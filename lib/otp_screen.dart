import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:muuguzi/authentication_repository.dart';
import 'package:muuguzi/patient_dashboard.dart';
import 'package:muuguzi/welcome_screen.dart';
import 'package:get/get.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();


  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Welcome()) : Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/otp2.png'),
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              SizedBox(height: 10),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Enter the OTP code sent:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: OtpTextField(
                  numberOfFields: 4,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    setState(() {
                    });
                  },
                  fieldWidth: MediaQuery.of(context).size.width * 0.12,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String otp = otpController.text.trim();
                if (otp.isNotEmpty)  {
                  bool verified = await AuthenticationRepository.instance.verifyOTP(otp);
                  if (!verified) {
                    Get.snackbar("Error", "OTP verification failed.");
                  }
                  // On success, navigation is handled inside verifyOTP
                } else {
                  Get.snackbar("Error", "Please enter the OTP code");
                }
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PatientDashboard()));

                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
