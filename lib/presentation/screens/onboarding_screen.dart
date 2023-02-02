import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);
var titleColor = const Color(0xff144272);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool skip = true;
  bool back = false;
//00425A
//144272
  @override
  Widget build(BuildContext context) {
    // TODO make it bloc and remove set state

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Find Parking Places Around You Easily",
          body: "body body body body body body ",
          decoration: PageDecoration(
              titleTextStyle:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 31,color:widget.titleColor),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/GPS navigator-bro.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
        PageViewModel(
          title: "Book and Pay Parking Quickly & Safely",
          body: "body body body body body body ",
          decoration: PageDecoration(
              titleTextStyle:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 31,color:widget.titleColor),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/City driver-cuate.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
        PageViewModel(
          title: "title title title title title",
          body: "body body body body body body ",
          decoration: PageDecoration(
              titleTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15, height: 1.5)),
          image: Image.asset('assets/images/logo-white.png',
              fit: BoxFit.cover, width: double.infinity, height: 400),
        ),
      ],
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.indigo,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      back: const Text(
        "Back",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      skip: const Text(
        "Skip",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),

      /// TODO routes
      onSkip: () {},
      next: const Text(
        "Next",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      done: const Text(
        "Finish",
        style: TextStyle(
          color: Colors.black,
        ),
      ),

      /// TODO routes
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ));
      },

      showSkipButton: skip,
      showNextButton: true,
      showBackButton: back,

      onChange: (index) {
        setState(() {
          if (index > 0) {
            skip = false;
            back = true;
          } else {
            skip = true;
            back = false;
          }
        });
      },
    );
  }
}
