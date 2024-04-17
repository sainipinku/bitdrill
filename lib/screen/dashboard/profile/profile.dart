import 'package:bitdrill/dilog_box/logout.dart';
import 'package:bitdrill/screen/dashboard/profile/change_password.dart';
import 'package:bitdrill/screen/dashboard/profile/edit_profile.dart';
import 'package:bitdrill/screen/dashboard/report/withdrwal_history.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List option = [
    {
      "title": "Edit Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "Change Password",
      "icon" : Icon(Icons.password),
      "nextScreen" : WithdrawalListScreen(),
    },
    {
      "title": "Logout",
      "icon" : Icon(Icons.logout),
      "nextScreen" : WithdrawalListScreen(),
    },
  ];
  String? memberID = "";
  String? memberName = "";
  void getUserDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      memberID = prefs.getString('user_memberid') ?? '';
      memberName = prefs.getString('user_memeberName') ?? '';
    });
    print('memeber id==========${prefs.getString('user_memberid')} member name==========${ prefs.getString('user_memeberName')}');

  }
   @override
  void initState() {
    // TODO: implement initState
     getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: SafeArea(
          child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: MyAppTheme.cardBgSecColor,
                  height: MediaQuery.sizeOf(context).height*0.15,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(memberName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                          Text(memberID!,style: TextStyle(fontSize: 17,color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  color: MyAppTheme.cardBgSecColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditProfile(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(

                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text('Edit Profile',style: MyStyles.white12LightStyle,),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: MyAppTheme.cardBgSecColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChangePassword(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(

                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.password,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text('Change Password',style: MyStyles.white12LightStyle,),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: MyAppTheme.cardBgSecColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) =>  LogoutDilogBox()
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(

                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.logout,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text('Logout',style: MyStyles.white12LightStyle,),
                        ],
                      ),
                    ),
                  ),
                ),
                //   ],
                // ),
              ]
          ),
        )
    );
  }

  logoutDialog(){
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
      ),
      title: const Text('BBTFX'),
      content: const Text('Are you sure want to logout!!'),
      actions: [
        Row(
          mainAxisAlignment : MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close',style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Logout'),

            ),
          ],
        ),
      ],
    );
  }

}





class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFd2a541),
    this.textColor = Colors.black,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
      ),
      child: SizedBox(

        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: textColor,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}