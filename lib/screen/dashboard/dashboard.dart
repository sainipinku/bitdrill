import 'package:bitdrill/screen/dashboard/profile/profile.dart';
import 'package:bitdrill/screen/dashboard/report/report_screen.dart';
import 'package:bitdrill/screen/dashboard/teams/team.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home/home.dart';


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
    ReportScreen(),
    ProfileScreen(),
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
        appBar: AppBar(backgroundColor: MyAppTheme.logoColor,title: Text('DashBoard',style: MyStyles.white16BoldStyle,),),
        body: screens[selectedIndex],
        bottomNavigationBar:BottomNavigationBar(
          items: const [
            /*BottomNavigationBarItem(
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
            ),*/
            BottomNavigationBarItem(icon: Icon(Icons.home),label: home),
            BottomNavigationBarItem(icon: Icon(Icons.group),label: type),
            BottomNavigationBarItem(icon: Icon(Icons.book_online),label: report),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: profile),
          ],
          currentIndex: selectedIndex,
          backgroundColor: MyAppTheme.logoColor,
          selectedLabelStyle: MyStyles.black14BoldStyle,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: MyStyles.black12BoldStyle,
          selectedItemColor: MyAppTheme.whiteColor,
          unselectedItemColor: MyAppTheme.brownColor,
          selectedIconTheme: IconThemeData(
            color: MyAppTheme.whiteColor
          ),
          unselectedIconTheme: IconThemeData(
              color: MyAppTheme.brownColor
          ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
