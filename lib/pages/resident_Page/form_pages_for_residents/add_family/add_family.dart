// import 'package:flutter/material.dart';
//
// class AddFamily extends StatefulWidget {
//   const AddFamily({Key? key}) : super(key: key);
//
//   @override
//   State<AddFamily> createState() => _AddFamilyState();
// }
// Widget _buildEmail() {
//   return RoundedTextInputField(
//     hintText: 'Enter email address',
//     controller: _email,
//     validator: (value) {
//       if (value!.isEmpty ||
//           !RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(value!)) {
//         return "enter correct email";
//       } else {
//         return null;
//       }
//     },
//   );
// }
// Widget _buildFirstName() {
//   return RoundedTextInputField(
//     hintText: 'Enter your firstname',
//     controller: _firstname,
//     validator: (value) {
//       if (value!.isEmpty || !RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
//         return "enter correct Firstname";
//       } else {
//         return null;
//       }
//     },
//   );
// }
// Widget _buildMobileNumber() {
//   return RoundedInputField(
//     hintText: 'Enter your mobile number',
//     controller: _mobileNumber,
//     validator: (value) {
//       if (value!.isEmpty ||
//           !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9+$]')
//               .hasMatch(value!)) {
//         return "enter correct mobile Number";
//       } else {
//         return null;
//       }
//     },
//   );
// }
// Widget _buildPassword() {
//   return RoundedPasswordField(
//     obscureText: _obscureText,
//     controller: _password,
//     suffixIcon: GestureDetector(
//         onTap: () {
//           setState(() {
//             _obscureText = !_obscureText;
//           });
//         },
//         child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
//             color: color.AppColor.landingPageTitle)),
//     validator: (value) {
//       if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
//         return "enter correct password";
//       } else {
//         return null;
//       }
//     },
//   );
// }
// Widget _buildConfirmPassword() {
//   return RoundedPasswordField(
//     obscureText: _obscureText2,
//     controller: _confirmPassword,
//     suffixIcon: GestureDetector(
//         onTap: () {
//           setState(() {
//             _obscureText2 = !_obscureText2;
//           });
//         },
//         child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
//             color: color.AppColor.landingPageTitle)),
//     validator: (value) {
//       if (value!.isEmpty || !RegExp(r'^[A-Za-z0-9_-]*$').hasMatch(value!)) {
//         return "enter correct Password";
//       } else if (value != _password.text) {
//         return "password is not correct";
//       } else {
//         return null;
//       }
//     },
//   );}
//
// class _AddFamilyState extends State<AddFamily> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
