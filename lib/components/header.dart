import 'package:flutter/material.dart';
import 'package:untitled/components/header.dart';

Widget header(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 29),

      //Geri dön Tuşu
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Color(0xFF0A1034), size: 27)),

      //kategoriler
      SizedBox(height: 24),
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xFF0A1034)),
      ),
    ],
  );
}
