import 'package:bitdrill/dilog_box/logout.dart';
import 'package:bitdrill/screen/dashboard/report/withdrwal_history.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List option = [
    {
      "title": "My Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "Change Password",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "My Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "My Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    }, {
      "title": "My Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "Change Password",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "My Profile",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },{
      "title": "Logout",
      "icon" : Icon(Icons.person),
      "nextScreen" : WithdrawalListScreen(),
    },
  ];

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
                  child: const Row(
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
                          Text('Shree ganeshay namah',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                          Text('2558594',style: TextStyle(fontSize: 17,color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  color: MyAppTheme.cardBgSecColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: option.length,
                      itemBuilder: (context, index) =>
                          customBtn(
                              onTap: () {
                                print('dhjdhjdhdjh');
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (_) =>  LogoutDilogBox()
                                );
                              },
                              icon: option[index]['icon'],
                              title: option[index]['title'] )
                  ),
                ),

                /*Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      icon: Icons.person,
                      text: 'My Profile',
                      onPressed: () {
                        // add screen logic
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RankBonusPage(),));
                      },
                    ),

                    CustomButton(
                      icon: Icons.person,
                      text: 'Change Password',
                      onPressed: () {
                        // add screen logic
                      },
                    ),
                    CustomButton(
                      icon: Icons.list_alt_outlined,
                      text: 'My Trade',
                      onPressed: () {
                        // add screen logic
                      },
                    ),
                    CustomButton(
                      icon: Icons.list_alt_outlined,
                      text: 'Add Referral',
                      onPressed: () {
                        // add screen logic
                      },
                    ),
                    CustomButton(
                      icon: Icons.list_alt_outlined,
                      text: 'Term & Condition',
                      onPressed: () {
                        // add screen logic
                      },
                    ),
                    CustomButton(
                      icon: Icons.list_alt_outlined,
                      text: 'Privacy Policy',
                      onPressed: () {
                        // add screen logic
                      },
                    ),
                    CustomButton(
                      icon: Icons.support_agent,
                      text: 'Support',
                      onPressed: () {
                        // add screen logic
                      },
                    ),

                    CustomButton(
                      icon: Icons.logout_outlined,
                      text: 'Logout',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => logoutDialog(),
                        );
                      },
                    ),*/
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


  customBtn({
    VoidCallback? onTap,
    required Widget icon,
    required String title,
  }){
    return InkWell(
      onTap: onTap ?? (){
        LogoutDilogBox();
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
            Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 10,),
            Text(title,style: MyStyles.white12LightStyle,),
          ],
        ),
      ),
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