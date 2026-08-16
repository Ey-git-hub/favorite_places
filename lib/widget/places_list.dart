// import 'package:favorite_places/main.dart';
import 'package:favorite_places/model/Places.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget{
  PlacesList({super.key,required this.places});
  final List<Places> places;
  @override
  Widget build(BuildContext context) {
    if(places.isEmpty){
      return Center(child: Text("No places added", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color:Theme.of(context).colorScheme.onBackground),),);
    }
    return ListView.builder(itemCount: places.length ,itemBuilder: (context, index) => ListTile(
      title: Text(places[index].title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color:Theme.of(context).colorScheme.onBackground),
        )
    ),
    );
  }
}