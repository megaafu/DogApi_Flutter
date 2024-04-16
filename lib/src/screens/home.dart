import 'package:flutter/material.dart';

import '../bloc/dogs_provider.dart';
import '../widgets/dogs_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DogsProvider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Dog Image Generate'),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(
              child: DogsList(
                dogBloc: bloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
