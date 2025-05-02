import 'package:flutter/material.dart';

class MySeason extends StatelessWidget {
  final String url;
  final String title;

  const MySeason({
    required this.url,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          url,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            shadows: [

            ],
          ),
        ),
      ],
    );
  }
}
