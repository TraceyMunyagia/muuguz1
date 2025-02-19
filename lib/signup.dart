import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication_repository.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Global key for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Local variables to store form data
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? selectedRole;

  // Function to register the user
  void registerUser() {
    // Validate and save form fields
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Check if required fields are not null
      if (email != null && password != null && fullName != null) {
        AuthenticationRepository.instance.createUserWithEmailandPassword(
          email: email!,
          password: password!,
          fullName: fullName!,
        );
      } else {
        Get.snackbar("Error", "Please fill in all required fields");
      }
    }
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Section 1: Header & Image
                Image.asset('assets/images/screen2.png'),
                const Text(
                  'Welcome New User!',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Kindly fill in your Details',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Section 2: Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Role dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Sign up as:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: ['Patient', 'Caregiver']
                            .map((role) => DropdownMenuItem(
                                  value: role,
                                  child: Text(role),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                          print('Selected role: $value');
                        },
                        validator: (value) =>
                            value == null ? 'Please select a role' : null,
                        hint: const Text('Pick a role'),
                      ),
                      const SizedBox(height: 10),
                      // Full Name field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Enter your name' : null,
                        onSaved: (value) => fullName = value,
                      ),
                      const SizedBox(height: 10),
                      // Phone Number field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // You can add validation for phone numbers if needed.
                        onSaved: (value) => phone = value,
                      ),
                      const SizedBox(height: 10),
                      // Email field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Enter a valid email'
                            : null,
                        onSaved: (value) => email = value,
                      ),
                      const SizedBox(height: 10),
                      // Password field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Create a password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) => value == null || value.length < 6
                            ? 'Password must be at least 6 characters'
                            : null,
                        onSaved: (value) => password = value,
                      ),
                      const SizedBox(height: 10),
                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: registerUser,
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Section 3: Navigation to Login
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already a user? ',
                          style: const TextStyle(color: Colors.redAccent),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
