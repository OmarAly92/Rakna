import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/components/custom_text_form.dart';
import 'package:rakna/presentation/screens/book_screen.dart';

class Payment2 extends StatelessWidget {
  const Payment2({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(height: 15),
                Container(
                  height: 190,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: SweepGradient(
                        center: AlignmentDirectional(1, -1),
                        startAngle: 1.7,
                        endAngle: 3,
                        colors: <Color>[
                          Colors.blue.shade700,
                          Colors.blue.shade700,
                          Colors.blue.shade800,
                          Colors.blue.shade800,
                          Colors.blue.shade700,
                          Colors.blue.shade700,

                          // Color(0xff148535),
                          // Color(0xff148535),
                          // Color(0xff0d6630),
                          // Color(0xff0d6630),
                          // Color(0xff148535),
                          // Color(0xff148535),
                        ],
                        stops: const <double>[
                          0.0,
                          0.3,
                          0.3,
                          0.7,
                          0.7,
                          1.0,
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VISA',
                              style: TextStyle(
                                  fontSize: 24.30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            'visa Electron',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '****\t\t****\t\t****\t\t****\t\t 2193',
                        style: TextStyle(
                            fontSize: 24.30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card holder',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Omar',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expires',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '07\t/\t23',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue.shade400,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                    hintText: 'Card Holder', leftPadding: 15, rightPadding: 15),
                CustomTextField(
                    hintText: 'Card number', leftPadding: 15, rightPadding: 15),
                Row(
                  //todo EXP CVV TextFormField
                  children: [
                    Expanded(
                        child: CustomTextField(
                            hintText: 'EXP', leftPadding: 15, rightPadding: 5)),
                    Expanded(
                        child: CustomTextField(
                            hintText: 'CVV', leftPadding: 5, rightPadding: 15)),
                  ],
                ),
                SizedBox(
                  height: height * .14,
                ),
                LogButton(
                  text: 'Add',
                  backgroundColor: Color(0xff067fd0),
                  textColor: Colors.white,
                  onPressed: () {},
                  radius: 5,
                  width: 355,
                  high: 53,
                ),

                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Enter your name',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Enter your card number',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                // Row(
                //   children: [
                //     Container(
                //       width: 150,
                //       height: 50,
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //             hintText: 'Exp Date',
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(15))),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 40,
                //     ),
                //     Container(
                //       width: 150,
                //       height: 50,
                //       child: TextFormField(
                //         decoration: InputDecoration(
                //           hintText: 'PIN number',
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(15)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: height * .240,
                // ),
                // Center(
                //   child: LogButton(
                //     text: 'Book',
                //     backgroundColor: Color(0xff144272),
                //     textColor: Colors.white,
                //     onPressed: () {
                //       // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment2(),));
                //     },
                //     radius: 5,
                //     width: 355,
                //     high: 53,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
