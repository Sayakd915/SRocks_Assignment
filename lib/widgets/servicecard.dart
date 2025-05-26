import 'package:flutter/material.dart';

import '../screens/servicedetailscreen.dart';

class ServiceCard extends StatelessWidget {
  final String iconUrl;
  final String backgroundUrl;
  final String title;
  final String description;

  const ServiceCard({
    required this.iconUrl,
    required this.backgroundUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff2F2F39),
        borderRadius: BorderRadius.circular(15),
        //Background Image
        image: DecorationImage(
          image: NetworkImage(backgroundUrl),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Row(
        children: [
          //Icon Image
          Image.network(
            iconUrl,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Card Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                //Card Description
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailScreen(
                      serviceTitle: title,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,))
        ],
      ),
    );
  }
}