import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';

class SlotPlace extends StatefulWidget {
  const SlotPlace({
    Key? key,
    required this.name1,
    required this.textName,
    required this.color1,
    required this.color2,
    required this.onTap,
    required this.onSelectedIndex,
    required this.index,
  }) : super(key: key);
  final String name1;
  final String textName;
  final Color color1;
  final Color color2;
  final GestureTapCallback onTap;
  final int onSelectedIndex;
  final int index;

  @override
  State<SlotPlace> createState() => _SlotPlaceState();
}

class _SlotPlaceState extends State<SlotPlace> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade600),
                    color: widget.onSelectedIndex == widget.index ? widget.color2 : widget.color1,
                    borderRadius: BorderRadius.circular(5)),
                width: 84,
                height: 36,
                child: Center(
                  child: Text(
                    widget.name1,
                    style: TextStyle(color: Colors.white.withOpacity(.85)),
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.textName,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: InkWell(
        //       onTap: widget.onTap,
        //       child: Container(
        //         width: 84,
        //         height: 36,
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.blue.shade600),
        //             color: widget.onSelectedIndex ==widget.index+5.5 ? widget.color2 : widget.color1,
        //             borderRadius: BorderRadius.circular(5)),
        //         child: Center(
        //           child: Text(
        //             widget.name2,
        //             style: TextStyle(color: Colors.white.withOpacity(.85)),
        //           ),
        //         ),
        //       )),
        // ),
      ],
    );
  }
}

//onTap 1

//onTap 2
