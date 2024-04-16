import 'package:flutter/widgets.dart';

import 'dogs_bloc.dart';
export 'dogs_bloc.dart';

class DogsProvider extends InheritedWidget {
  final DogBloc bloc;
  DogsProvider({Key? key, required Widget child})
      : bloc = DogBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(oldWidget) => true;
  static DogBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<DogsProvider>()
            as DogsProvider)
        .bloc;
  }
}
