import 'package:flutter/material.dart';

class Projectspage extends StatelessWidget {
  const Projectspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: Container(
          child: Center(
            child: Text(
              "You clicked the Projects Button",
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
