import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peedika/views/Cart.dart';
import 'package:peedika/views/Profile.dart';
import 'package:peedika/views/home.dart';
import 'package:peedika/views/shops.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> pages = [Home(), Shops(), Cart(), Profile()];
  int currentindex = 0;
  PageController _pageController = PageController();

  void navigatetopage(int index) {
  //  _pageController.animateToPage(to_pageindex, duration: duration, curve: curve)
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index){
          navigatetopage(index);
          setState(() {
            currentindex=index;
          });
        },
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[currentindex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: .w900,color: Colors.black),
        unselectedLabelStyle: TextStyle(fontWeight: .w300,color: Colors.black),
        onTap: (index){
          setState(() {
            currentindex=index;
          });
          navigatetopage(index);
        },
        currentIndex: currentindex,
        type: .fixed,
        items: [
          BottomNavigationBarItem(icon:currentindex==0?Icon(Icons.home): Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon:currentindex==1?Icon(Icons.shopping_bag): Icon(Icons.shopping_bag_outlined),label: "Shops"),
          BottomNavigationBarItem(icon:currentindex==2?Icon(Icons.shopping_cart): Icon(Icons.shopping_cart_outlined),label: "Cart"),
          BottomNavigationBarItem(icon:currentindex==3?Icon(Icons.account_circle): Icon(Icons.account_circle_outlined),label: "Profile"),
        ],
      ),
    );
  }
}
