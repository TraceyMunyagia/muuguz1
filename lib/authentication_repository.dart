import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muuguzi/patient_dashboard.dart';
import 'package:muuguzi/signup_email_password_failure.dart';
import 'package:muuguzi/welcome_screen.dart';
import 'package:muuguzi/otp_screen.dart';
import 'login.dart';


class AuthenticationRepository {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> firebaseUser = Rxn<User>();
  var verificationid= ''.obs;

  AuthenticationRepository() {
    onReady();
  }

  void onReady() {
    firebaseUser.value = _auth.currentUser;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIntialScreen);
  }

  void _setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Welcome())
        : Get.offAll(() => const Login());
  }

 Future <void> phoneAuthentication(String phoneNo) async{
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNo,
    verificationCompleted: (credential) async {
     await _auth.signInWithPhoneNumber(credential as String);
      Get.offAll(() => Otp());
    }, 
    verificationFailed: (e) {
      if (e.code == 'Invalid-phone-number') {
        Get.snackbar('Error', 'The provided phone number is not valid.');
      }
    }, 
    codeSent: (verificationId, resendToken) {
       verificationid.value = verificationId;
        Get.to(() => Otp());
    }, 
    codeAutoRetrievalTimeout: (verificationId) {
       verificationid.value = verificationId;
    },
    );
 }
 Future<bool> verifyOTP(String otp) async{
   var credentials =await _auth.
   signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationid.value, smsCode: otp));
   if (credentials.user != null) {
        Get.offAll(() => const PatientDashboard());
        return true;
      }
      return false;
  }
  


  /// Now accepts [fullName] to update the user profile
  Future<void> createUserWithEmailandPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        // Update the displayName with the provided fullName.
        await userCredential.user!.updateDisplayName(fullName);
        await userCredential.user!.reload(); // Make sure changes take effect.
        Get.offAll(() => const Login());
      } else {
        Get.offAll(() => const Welcome());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      final ex = SignupEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );
       Get.snackbar("Success", "Login Successful");
      Get.offAll(() => PatientDashboard());

    } catch (e) {
       Get.snackbar("Login Failed", e.toString());

    }
  }

  Future<void> logout() async => await _auth.signOut();
}
