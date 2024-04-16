import 'package:rxdart/rxdart.dart';

import '../model/dog.dart';
import '../resources/repository.dart';

class DogBloc {
  final _repository = Repository();
  final _dogslist = BehaviorSubject<List<DogData?>>();
  final _dogOutput = PublishSubject<Map<int, Future<DogData?>>>();
  final _dogFetcher = BehaviorSubject<int>();

  Stream<List<DogData?>> get alldogs => _dogslist.stream;
  Stream<Map<int, Future<DogData?>>> get dog => _dogOutput.stream;

  Function(int) get fetchDog => _dogFetcher.sink.add;

  DogBloc() {
    _dogFetcher.stream.transform(_dogTranformer()).pipe(_dogOutput);
  }

  fetchAllDogs() async {
    final dogs = await _repository.fetchDogs();
    _dogslist.sink.add(dogs);
  }

  _dogTranformer() {
    return ScanStreamTransformer(
      (Map<int, Future<DogData?>> cache, int id, index) {
        cache[id] = _repository.fetchDog(id);
        return cache;
      },
      <int, Future<DogData?>>{},
    );
  }
}
