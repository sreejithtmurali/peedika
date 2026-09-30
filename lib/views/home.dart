import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      child: Scaffold(
        backgroundColor: Color(0xffF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "East Fort, Thrissur",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1F2937),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: Color(0xff9CA3AF),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon:FaIcon(FontAwesomeIcons.github),
              style: IconButton.styleFrom(backgroundColor: Colors.white),
            ),
            SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notification_add),
              style: IconButton.styleFrom(backgroundColor: Colors.white),
            ),
            SizedBox(width: 8),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'All your Local Stores in ',
                  style: GoogleFonts.montserrat(
                    fontWeight: .bold,
                    fontSize: 20,
                    color: Color(0xff262626),
                  ),
                  //style: TextStyle(fontWeight: .bold,fontSize: 20,color: Color(0xff262626,)),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' One App',
                      style: GoogleFonts.montserrat(color: Color(0xff8ACA11)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                "From groceries to gadgets, shop everything you need.",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Color(0xffA6A6A6),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
