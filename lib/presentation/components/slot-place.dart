import 'package:flutter/material.dart';

class SlotPlace extends StatefulWidget {
  const SlotPlace(
      {Key? key,
      required this.name1,
      required this.textName,
      required this.name2,
      required this.color})
      : super(key: key);
  final String name1;
  final String name2;
  final String textName;
  final Color color;

  @override
  State<SlotPlace> createState() => _SlotPlaceState();
}

class _SlotPlaceState extends State<SlotPlace> {
  late bool inkWell1 = false;
  late bool inkWell2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo.shade800),
                  color: inkWell1 == true?Colors.yellow.shade900:widget.color,
                  borderRadius: BorderRadius.circular(5)),
              width: 84,
              height: 36,
              child: Center(
                child: Text(
                  widget.name1,
                  style: TextStyle(color: Colors.white.withOpacity(.85)),
                ),
              ),
            ),
            onTap: () {
              inkWell1 = !inkWell1;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.textName,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo.shade800),
                  color: inkWell2 == true?Colors.yellow.shade900: widget.color,
                  borderRadius: BorderRadius.circular(5)),
              width: 84,
              height: 36,
              child: Center(
                child: Text(
                  widget.name2,
                  style: TextStyle(color: Colors.white.withOpacity(.85)),
                ),
              ),
            ),
            onTap: () {
              inkWell2 = !inkWell2;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
