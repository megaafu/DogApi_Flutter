import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../bloc/dogs_provider.dart';
import '../screens/dog_details.dart';
import 'dog_card.dart';

class DogItem extends StatelessWidget {
  final DogBloc dogBloc;
  final int id;

  const DogItem({
    super.key,
    required this.id,
    required this.dogBloc,
  });

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return StreamBuilder(
      stream: dogBloc.dog,
      builder: (context, snapshot) {
        var dog = snapshot.data;
        if (dog == null) {
          return const CircularProgressIndicator();
        }
        return FutureBuilder(
          future: dog[id],
          builder: (context, snap) {
            var message = snap.data;
            if (message == null) {
              return const CircularProgressIndicator();
            }
            return Row(
              children: [
                Hero(
                  tag: id,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DogDetails(
                            id: id,
                            message: message.message,
                          ),
                        ),
                      ),
                      child: DogCard(
                        message: message.message,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
