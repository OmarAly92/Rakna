import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
  double bottom = 20;
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Profile',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),

                              ///todo put avatar image
                              child: Image.asset(
                                  'assets/images/default-avatar-profile.jpg')),
                        ),
                        Positioned(
                          top: 89,
                          left: 80,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff067fd0),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    const Text(
                      'User name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text('user@gmail.com')
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.payment_rounded,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Payment',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Notification',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.security,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Security',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.help_center_outlined,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Help',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Dark Theme',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: widget.bottom),
                      child: SizedBox(
                        height: 40,
                        child: InkWell(
                          onTap: () {},
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 28,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
