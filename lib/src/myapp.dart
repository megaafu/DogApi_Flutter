import 'package:flutter/material.dart';

import 'bloc/dogs_provider.dart';
import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DogsProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teste1',
        home: Home(),
      ),
    );
  }
}
