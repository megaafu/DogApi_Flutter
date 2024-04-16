import 'package:flutter/material.dart';


class DogCard extends StatelessWidget {
  final String message;
  const DogCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Container(
          height: 260,
          width:260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            image: DecorationImage(
              image: NetworkImage(message),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
