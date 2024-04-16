import '../model/dog.dart';
import 'dogs_api.dart';

class Repository {
  List<DogData?> dogs = [];
  final dogApi = DogsApi();
  Future<DogData?> fetchDog(int index) async {
    DogData? dog;
    for (int i = 0; i < dogs.length; i++) {
      if (index == i) {
        dog = dogs[i];
      }
    }
    return dog;
  }

  Future<List<DogData?>> fetchDogs() async {
    DogData? dog = await dogApi.fetchDog();
    dogs.add(dog);

    return dogs;
  }
}
