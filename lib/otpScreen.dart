// import 'package:flutter/material.dart';
//
// class otpscreen extends StatefulWidget {
//   const otpscreen({Key? key}) : super(key: key);
//
//   @override
//   State<otpscreen> createState() => _otpscreenState();
// }
//
// class _otpscreenState extends State<otpscreen> {
//   TextEditingController otpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OTP Screen"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   hintText: "Enter the otp",
//                   suffixIcon: Icon(Icons.phone),
//                   border: OutlineInputBorder()),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           ElevatedButton(onPressed: onPressed, child: Text("OTP"))
//         ],
//       ),
//     );
//   }
// }
