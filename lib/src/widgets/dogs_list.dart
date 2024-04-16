import 'package:flutter/material.dart';

import '../bloc/dogs_provider.dart';
import '../model/dog.dart';
import 'dog_item.dart';

class DogsList extends StatelessWidget {
  final DogBloc dogBloc;
  const DogsList({super.key, required this.dogBloc});

  @override
  Widget build(BuildContext context) {
    dogBloc.fetchAllDogs();
    return StreamBuilder(
      stream: dogBloc.alldogs,
      builder: (context, AsyncSnapshot<List<DogData?>> snapshot) {
        var dogs = snapshot.data;
        if (dogs == null) {
          return const CircularProgressIndicator();
        }
        print(dogs);

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: dogs.length + 1,
                (context, index) {
                  if (index < dogs.length) {
                    dogBloc.fetchDog(index);
                    return DogItem(
                      id: index,
                      dogBloc: dogBloc,
                    );
                  } else {
                    dogBloc.fetchAllDogs();
                    return const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
