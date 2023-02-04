import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/book_screen.dart';

class Payment2 extends StatelessWidget {
  const Payment2({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your card number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Exp Date',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'PIN number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .465,
              ),
              Center(
                child: LogButton(
                  text: 'Book',
                  backgroundColor: Color(0xff144272),
                  textColor: Colors.white,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment2(),));
                  },
                  radius: 5,
                  width: 355,
                  high: 53,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
