import 'package:favorite_places/model/Places.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});

  final Places place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body:Stack(
        children: [
          Image.file(place.image, width: double.infinity, fit: BoxFit.cover,height: double.infinity,),
        ],
      ),
    );
  }
}