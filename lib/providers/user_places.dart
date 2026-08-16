import 'package:favorite_places/model/Places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Places>>{
UserPlaceNotifier() :super([]);

void addPlace(String title){
  final newPlace=Places(title: title);
  state=[newPlace,...state];
}
}
final userPlaceProvider=StateNotifierProvider((ref)=>UserPlaceNotifier());
