import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late double height, width;
  Color color = const Color.fromRGBO(2, 32, 42, .82);

  @override
  Widget build(BuildContext context) {
    bool eye = true;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * .5,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(50)),
                  child: Image.asset(
                    'assets/images/garage.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height * .5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * .24,
                        ),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(200))),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                  'assets/images/rakna_logo.jpg')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: width * .224, right: width * .224),
                        child: const Text(
                          'Welcome Back!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Container(
                    height: height * .5,
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
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 40),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon:
                                  IconButton(
                                    icon: Icon(eye == true ?Icons.visibility:Icons.visibility_off),
                                    onPressed: () {
                                    eye = !eye;
                                    setState(() {});
                                  },
                                  ),
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 250, top: 14),
                          child: TextButton(
                            onPressed: () {},
                            child:  const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Color(0xff144272)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: LogButton(
                            text: 'Sign in',
                            backgroundColor: Color(0xff1C82AD),
                            textColor: Colors.white,
                            radius: 15,
                            width: 350,
                            high: 60,
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * .213, right: width * .213, top: 14),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' SIGN UP',
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
