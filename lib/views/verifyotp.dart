import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:peedika/services/apiservice.dart';
import 'package:peedika/services/userservice.dart';
import 'package:peedika/views/dashboard.dart';

class Verifyotp extends StatefulWidget {
  late String phone;
  Verifyotp({super.key, required this.phone});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  int count = 30;
  Apiservice apiservice = Apiservice();
  UserService userService = UserService();
  startCounter() {
    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        count -= 1;
      });
    });
  }

  void reset() {
    count = 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    startCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: .all(24),
            width: MediaQuery.widthOf(context),
            height: 440,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .3),
                  blurRadius: 17.5,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: .circular(34),
              gradient: LinearGradient(
                colors: [Color(0xffD7FFBA), Color(0xffFFFFFF)],
                begin: .topCenter,
                end: .bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                Container(
                  child: Icon(Icons.login),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .3),
                        blurRadius: 17.5,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: .circular(24),
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .bold,
                    color: Color(0xff1A1C1C),
                  ),
                ),
                Text(
                  "Please enter the 6-digit code sent to\n +91 XXXXX ${widget.phone.substring(5, 10)}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: .w600,
                    color: Color(0xff404A37),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: .centerLeft,
                  child: Text(
                    "OTP",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 40,

                  child: OtpPinField(
                    maxLength: 6,
                    fieldHeight: 20,
                    fieldWidth: 40,
                    key: _otpPinFieldController,
                    otpPinFieldStyle: OtpPinFieldStyle(showHintText: true),
                    autoFillEnable: false,
                    textInputAction: TextInputAction.done,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                    onSubmit: (text) async {
                      if (text.length == 6) {
                        final response = await apiservice.verifyOtp(widget.phone, text, " ", "",);
                        if (mounted) {
                          if (response!.success == true) {
                            await userService.saveUser(response);
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Dashboard(),));
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registration Failed"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      }
                    },
                    onChange: (String text) {},
                  ),
                ),
                SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    if (count == 0) {
                      reset();
                    }
                  },
                  child: Text(
                    "${count > 0 ? "Resend code in 00:${count}" : "Resend Code"}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .w600,
                      color: Color(0xff1A1C1C),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward),
                  iconAlignment: .end,
                  onPressed: () async {

                  },
                  label: Text("Verify & Proceed"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: Size(.maxFinite, 56),
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
