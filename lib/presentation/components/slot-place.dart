import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';

class SlotPlace extends StatefulWidget {
   SlotPlace(
      {Key? key,
      required this.name1,
      required this.textName,
      required this.name2,
        required this.color1,
        required this.color2,
        required this.onTap,
        required this.tap,
      })
      : super(key: key);
  final String name1;
  final String name2;
  final String textName;
  final Color color1;
  final Color color2;
  final GestureTapCallback onTap;
  final bool tap;

  @override
  State<SlotPlace> createState() => _SlotPlaceState();
}

class _SlotPlaceState extends State<SlotPlace> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade600),
                  color: widget.tap == true?widget.color2:widget.color1,
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
            onTap: widget.onTap
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
                  border: Border.all(color: Colors.blue.shade600),
                  color: widget.tap == true?widget.color2: widget.color1,
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
            onTap: widget.onTap
          ),
        ),
      ],
    );
  }
}

//onTap 1






//onTap 2
