import 'package:favorite_places/model/Places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
class UserPlaceNotifier extends StateNotifier<List<Places>>{
UserPlaceNotifier() :super([]);

void addPlace(String title, File image){
  final newPlace=Places(title: title, image: image);
  state=[newPlace,...state];
}
}
final userPlaceProvider=StateNotifierProvider<UserPlaceNotifier,List<Places>>((ref)=>UserPlaceNotifier());
 