import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DogDetails extends StatelessWidget {
  final int id;
  final String message;
  const DogDetails({
    super.key,
    required this.id,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return Hero(
      tag: id,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('See Image Detail'),
        ),
        body: Center(
          child: Material(
            color: Colors.transparent,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(message),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
