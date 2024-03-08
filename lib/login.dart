import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp.dart';

class phonehome extends StatefulWidget {
  const phonehome({Key? key}) : super(key: key);

  @override
  State<phonehome> createState() => _phonehomeState();
}

class _phonehomeState extends State<phonehome> {
  TextEditingController phonenumber = TextEditingController();
  @override
  Future<dynamic> sendocde() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91' + phonenumber.text,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar('Error Occurred', e.code);
          },
          codeSent: (String vid, int? token) {
            Get.to(
              OtpPage(
                vid: vid,
              ),
            );
          },
          codeAutoRetrievalTimeout: (vid) {});
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error occurred", e.code);
    } catch (e) {
      Get.snackbar('error occured', e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset('images/cow.png'),
          Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
          ),
          SizedBox(
            height: 20,
          ),
          phonetext(),
          SizedBox(
            height: 50,
          ),
          button()
        ],
      ),
    );
  }

  Widget button() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          sendocde();
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(90, 208, 248, 1),
            padding: EdgeInsets.all(16)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            "Receive OTP",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget phonetext() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45),
      child: TextField(
        controller: phonenumber,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            prefix: Text('+91'),
            prefixIcon: Icon(Icons.phone),
            labelText: "Enter phone number",
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
