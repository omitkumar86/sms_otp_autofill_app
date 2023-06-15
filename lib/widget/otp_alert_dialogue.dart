import 'package:flutter/material.dart';
import 'package:otp_autofill_app/home_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpAlertDialogue extends StatefulWidget {
  const OtpAlertDialogue({super.key});

  @override
  State<OtpAlertDialogue> createState() => _OtpAlertDialogueState();
}

class _OtpAlertDialogueState extends State<OtpAlertDialogue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenOtpCode();
  }

  void _listenOtpCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP Code",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              PinFieldAutoFill(
                keyboardType: TextInputType.number,
                codeLength: 4,
                onCodeChanged: (value) {
                  print(value);
                  if (value!.length == 4) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// otpAlertDialogue(BuildContext context) {
//   showDialog(
//     // barrierDismissible: false,
//     context: context,
//     builder: (context) => AlertDialog(
//       scrollable: true,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       title: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "OTP Code",
//               style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w700),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             PinFieldAutoFill(
//               codeLength: 4,
//               onCodeChanged: (value) {
//                 print(value);
//               },
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             // PinCodeTextField(
//             //   keyboardType: TextInputType.number,
//             //   length: 5,
//             //   obscureText: false,
//             //   animationType: AnimationType.fade,
//             //   pinTheme: PinTheme(
//             //     shape: PinCodeFieldShape.box,
//             //     borderRadius: BorderRadius.circular(5.r),
//             //     fieldHeight: 45,
//             //     fieldWidth: 45,
//             //     activeFillColor: Colors.white,
//             //   ),
//             //   animationDuration: const Duration(milliseconds: 300),
//             //   // enableActiveFill: true,
//             //   onCompleted: (v) {
//             //     if (kDebugMode) {
//             //       print("Completed");
//             //     }
//             //   },
//             //   onChanged: (value) {
//             //     if (kDebugMode) {
//             //       print(value);
//             //     }
//             //   },
//             //   beforeTextPaste: (text) {
//             //     if (kDebugMode) {
//             //       print("Allowing to paste $text");
//             //     }
//             //     return true;
//             //   },
//             //   appContext: context,
//             // ),
//           ],
//         ),
//       ),
//       // actions: [
//       //   InkWell(
//       //     onTap: () {
//       //     },
//       //     child: Padding(
//       //       padding: EdgeInsets.symmetric(
//       //         vertical: 20.h,
//       //         horizontal: 10.w,
//       //       ),
//       //       child: Container(
//       //         height: 45.h,
//       //         width: 300.w,
//       //         decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(20.r),
//       //           color: AppColorResources.buttonColor,
//       //         ),
//       //         child: Center(
//       //           child: Text(
//       //             "Done",
//       //             style: myStyleInter(
//       //                 16.sp, AppColorResources.primaryWhite, FontWeight.w600),
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //   ),
//       // ],
//     ),
//   );
// }
