import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * .5,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(30),
                child: Image.asset('assets/images/111.png')),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .55, left: 12, right: 12),
            child: Column(
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(onPressed: () {}, child: const Text('sign in')),
                SizedBox(height: 25),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 2,
                  endIndent: 5,
                ),
                TextButton(
                    onPressed: () {}, child: Text('Don\'t have account?'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
