import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_places.dart';
import 'package:favorite_places/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerWidget{
  const PlacesListScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userPlaces=ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>AddPlacesScreen(),)
                ,
                );
          },
          )
        ],
      ),
      body: PlacesList(places: userPlaces) ,
    )
  ;
  }
}