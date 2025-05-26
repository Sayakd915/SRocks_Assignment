import 'package:flutter/material.dart';

class Trackboxpage extends StatelessWidget {
  const Trackboxpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: Container(
          child: Center(
            child: Text(
              "You clicked the TrackBox Button",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Syne',
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
      ),
    );
  }
}

