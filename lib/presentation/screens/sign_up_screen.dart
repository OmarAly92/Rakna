import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../components/LogButton_Widget.dart';
import 'old1H.dart';
import 'navigation_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controllerEmail = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Color color = const Color(0xff04345C);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height * .15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 14),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 1),
                          child: InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                CupertinoIcons.arrow_left_circle_fill,
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Container(
                    height: height * .9,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 55),
                          child: LogButton(
                            text: 'Sign up',
                            backgroundColor: const Color(0xff1C82AD),
                            textColor: Colors.white,
                            radius: 15,
                            width: 350,
                            high: 60,
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarScreen(),));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * .200, right: width * .200, top: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' SIGN IN',
                                  style: TextStyle(
                                    color: Color(0xff144272),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
