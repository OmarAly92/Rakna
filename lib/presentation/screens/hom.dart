import 'package:flutter/material.dart';

class hom extends StatefulWidget {
  const hom({Key? key}) : super(key: key);

  @override
  State<hom> createState() => _homState();
}

class _homState extends State<hom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Text('Hi, User This Promos for You!',style: TextStyle()),
            )
          ],
        ),
      ),
    );
  }
}
