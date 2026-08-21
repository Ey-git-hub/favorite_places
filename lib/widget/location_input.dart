import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget{
  const LocationInput({super.key});

  @override
  State<StatefulWidget> createState() {
 return _LocationInput();
  }
  
}
class _LocationInput extends State<LocationInput>{
  @override
  Widget build(BuildContext context) {
   return Column(children: [
    Container(
      width: double.infinity,
      height: 170,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
    ),
    child: Text(textAlign: TextAlign.center,'No map location added',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color:Theme.of(context).colorScheme.onSurface)),
    ),
    Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      TextButton.icon(icon:Icon(Icons.location_on),onPressed: (){}, label: Text('Get Current location')),
      TextButton.icon(icon:Icon(Icons.map) ,onPressed:(){} ,label:Text('Select on Map') ,)
    ],)
   ],);
  }

}