import 'package:favorite_places/model/Places.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LocationInput extends StatefulWidget{
  const LocationInput({super.key});

  @override
  State<StatefulWidget> createState() {
 return _LocationInput();
  }
  
}
class _LocationInput extends State<LocationInput>{
  Location?  _pickedLocation;
  var _isGettingLocation=false;

  void _getCurrentLocation() async{
    Location location = Location();

bool serviceEnabled;
PermissionStatus permissionGranted;
LocationData locationData;

serviceEnabled = await location.serviceEnabled();
if (!serviceEnabled) {
  serviceEnabled = await location.requestService();
  if (!serviceEnabled) {
    return;
  }
}
permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }
}
setState((){
_isGettingLocation=true;
});
// if(${locationData.latitude} == null || ${locationData.longitude} == null){
  
//   return;
// }

locationData = await location.getLocation();
final url=Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude},${locationData.longitude}&key=AIzaSyBr_8aDyY4YnM9Yr9GgmkUhu5z3VT6ytms');
final response=await http.get(url);
final data=json.decode(response.body);
final address=data['results'][0]['formatted_address'];
setState((){
  _pickedLocation=PlaceLocation(
    latitude: locationData.latitude,
    longitude: locationData.longitude,
    address: address,
  ) as Location? ;
  _isGettingLocation=false;
});

  }
  @override
  Widget build(BuildContext context) {
    Widget previewContent=Text(textAlign: TextAlign.center,'No map location added',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color:Theme.of(context).colorScheme.onSurface));
        if(_isGettingLocation){
          previewContent=CircularProgressIndicator();
        }
   return Column(children: [
    Container(
      width: double.infinity,
      height: 170,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
    ),
    child: previewContent,
    ),
    Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      TextButton.icon(icon:Icon(Icons.location_on),onPressed: _getCurrentLocation, label: Text('Get Current location')),
      TextButton.icon(icon:Icon(Icons.map) ,onPressed:(){} ,label:Text('Select on Map') ,)
    ],)
   ],);
  }

}
