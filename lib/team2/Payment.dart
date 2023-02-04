import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
               children: [
                 IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                 Text(
                     'Payment',
                   style: TextStyle(
                     fontSize: 30.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),


               ],
              ),
              SizedBox(height: 20,),
              Row(
                children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Choose Payment Methods',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],),
            Row(
              children: [
                Container(
                  width: 350,
                    child: ElevatedButton(onPressed: (){}, child: Text('Add New Card'))
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
