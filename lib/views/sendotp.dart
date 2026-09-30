import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peedika/views/verifyotp.dart';

class Sendotp extends StatefulWidget {
  const Sendotp({super.key});

  @override
  State<Sendotp> createState() => _SendotpState();
}

class _SendotpState extends State<Sendotp> {
  TextEditingController controller=TextEditingController();
  final key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: .all(24),
            width: MediaQuery.widthOf(context),
            height: 400,
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
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .bold,
                    color: Color(0xff1A1C1C),
                  ),
                ),
                Text(
                  "Login with your mobile number to get started",
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
                    "mobile number",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 48,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        fit: .tight,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: .circular(23),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.black,
                            ),
                            hintText: "+91",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        flex: 6,
                        fit: .tight,
                        child: Form(
                          key: key,
                          child: TextFormField(
                            validator: (v){
                              return v!.length!=10?"enter valid phone number":null;
                            },
                            controller: controller,
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: .circular(23),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Color(0xff707A65),
                              ),
                              hintText: "0000000000",
                              hintStyle: TextStyle(
                                color: Color(0xff707A65),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward),
                  iconAlignment: .end,
                  onPressed: () {
                   if(key.currentState!.validate()){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Verifyotp(phone:controller.text.trim()),));
                   }
                  },
                  label: Text("Get OTP"),
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
