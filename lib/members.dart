import 'package:flutter/material.dart'; 
import 'package:carousel_slider/carousel_slider.dart';

class MemberWidget extends StatelessWidget {
  final Member member;

  const MemberWidget({required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(member.imageUrl),
        ),
        SizedBox(height: 20),
        Text(
          member.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          member.position,
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 10),
        Text(
          member.number,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class Member {
  final String name;
  final String position;
  final String number;
  final String imageUrl;

  Member({
    required this.name,
    required this.position,
    required this.number,
    required this.imageUrl,
  });
}