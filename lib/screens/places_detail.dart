import 'package:favorite_places/widget/places_list.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget{
  const PlacesListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          onPressed: (){},
          )
        ],
      ),
      body: PlacesList(places: []) ,
    )
  ;
  }
}