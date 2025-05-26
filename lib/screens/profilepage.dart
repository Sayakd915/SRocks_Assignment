import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      appBar: AppBar(
        backgroundColor: const Color(0xff18171C),
        title: Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Syne'),),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Container(
          child: Center(
            child: Text(
              "This is your Profile page",
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
