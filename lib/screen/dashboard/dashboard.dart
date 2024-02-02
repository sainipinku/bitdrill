import 'package:bitdrill/screen/dashboard/profile.dart';
import 'package:bitdrill/screen/dashboard/report.dart';
import 'package:bitdrill/screen/dashboard/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DateTime pre_backpress = DateTime.now();
  int selectedIndex = 0;
  List<Widget> screens = [
    Home(),
    Team(),
    Report(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          //show snackbar
          const snack = SnackBar(
            content: Text('Press Back button again to Exit'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child:  Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0 ? SvgPicture.asset(
                'assets/icons/select_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.black45,
              ): SvgPicture.asset(
                'assets/icons/unselect_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ?  SvgPicture.asset(
                'assets/icons/select_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.black45,
              ) : SvgPicture.asset(
                'assets/icons/unselect_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              label: 'Team',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ?  SvgPicture.asset(
                'assets/icons/select_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.black45,
              ): SvgPicture.asset(
                'assets/icons/unselect_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ?  SvgPicture.asset(
                'assets/icons/select_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.black45,
              ): SvgPicture.asset(
                'assets/icons/unselect_news.svg',
                allowDrawingOutsideViewBox: true,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              label: 'Profile',
            ),


          ],
          currentIndex: selectedIndex,
          backgroundColor: Colors.blue,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontSize: 13,
            color: Colors.black45,
          ),
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontSize: 13,
            color: Colors.white,
          ),
          selectedItemColor: Colors.black45,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
