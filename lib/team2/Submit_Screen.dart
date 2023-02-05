import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/screens/add_payment.dart';

class BookTime extends StatefulWidget {
  const BookTime({Key? key}) : super(key: key);

  @override
  State<BookTime> createState() => _BookTimeState();
}

class _BookTimeState extends State<BookTime> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    const Text(
                      'Time ',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Select Date',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: TableCalendar(
                        locale: 'en_US',
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          rightChevronVisible: false,
                          leftChevronVisible: false,
                        ),
                        // calendarStyle: CalendarStyle(
                        //   selectedDecoration: BoxDecoration(color:Color(0xff144272),
                        //   )),
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                  ),
                ),
                Text('${today.toString().split(' ')[0]}'),
                SizedBox(
                  height: height * .03,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Start Hour',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 150),
                    const Text(
                      'End Hour',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 45,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .34,
                    ),
                    Container(
                      width: 100,
                      height: 45,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .15),
                Center(child: Text('10/E£',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                SizedBox(height: 20),
                Center(
                  child: LogButton(
                    text: 'Book',
                    backgroundColor: const Color(0xff144272),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Payment2(),));
                    },
                    radius: 5,
                    width: width * .82,
                    high: 53,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
