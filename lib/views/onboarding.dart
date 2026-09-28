import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peedika/models/onbordingModel.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Onbordingmodel> list = [
    Onbordingmodel(
      "assets/icons/img.png",
      "Everything you need,\nfrom nearby stores.",
      "Groceries, meat, medicine, bakery, electricals & more  all in one app.",
    ),
    Onbordingmodel(
      "assets/icons/img.png",
      "Your local stores,\none smart app.",
      "Find what you need, order from nearby stores, \nand get it delivered to your doorstep.",
    ),
    Onbordingmodel(
      "assets/icons/img.png",
      "Everything you need,\nfrom nearby stores.",
      "Groceries, meat, medicine, bakery, electricals & more  all in one app.",
    ),
    Onbordingmodel(
      "assets/icons/img.png",
      "Your local stores,\none smart app.",
      "Find what you need, order from nearby stores, \nand get it delivered to your doorstep.",
    ),
  ];
  final pagecontroller = PageController();
  int current_page = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: null,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 145),
            Container(
              width: 280,
              height: 400,
              // color: Colors.green.shade100,
              child: PageView.builder(
                controller: pagecontroller,
                itemCount: list.length,
                onPageChanged: (index) {
                  setState(() {
                    current_page = index;
                  });
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Image.asset(
                      "${list[index].image}",
                      height: 257,
                      width: 246,
                      fit: .cover,
                    ),
                    Text(
                      "${list[index].title}",
                      maxLines: 2,
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: Color(0xff1A1C1C),
                      ),
                    ),
                    Text(
                      "${list[index].description}",
                      maxLines: 2,
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w600,
                        color: Color(0xffADADAD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(width: 50, height: 20, color: Colors.green.shade100),
            Spacer(),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //navigate to nextpage
                  },
                  child: Text("Skip"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(147, 53),
                    shape: RoundedRectangleBorder(borderRadius: .circular(23)),
                    backgroundColor: Color(0xfff3f3f3),
                    foregroundColor: Color(0xff404A37),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward),
                  iconAlignment: .end,
                  onPressed: () {
                   if(current_page==list.length-1){
                     //navigate to next page
                   }
                   else{
                     pagecontroller.nextPage(duration: Duration(seconds: 2), curve: Curves.easeInOut);
                   }
                  },
                  label: Text(
                    "${current_page == (list.length - 1) ? "Explore Stores" : "Next"}",
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(147, 53),
                    shape: RoundedRectangleBorder(borderRadius: .circular(23)),
                    backgroundColor: Color(0xff63C31E),
                    foregroundColor: Color(0xffffffff),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
