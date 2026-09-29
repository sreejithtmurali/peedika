import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Verifyotp extends StatefulWidget {
  const Verifyotp({super.key});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: EdgeInsets.all(24),
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
                Container(
                  padding: EdgeInsets.all(24),
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
                    borderRadius: .circular(34),
                   color: Colors.white
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
