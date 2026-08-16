import 'package:favorite_places/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacesScreen extends ConsumerStatefulWidget{
  const AddPlacesScreen({super.key});
  @override
  ConsumerState<AddPlacesScreen> createState() {
    return _AddPlacesScreen();
  }
}

class _AddPlacesScreen extends ConsumerState<AddPlacesScreen>{
  final _titleController=TextEditingController();

void _savePlace(){
  final enteredTitle=_titleController.text;
  if(enteredTitle.isEmpty){
    return;
  }
  ref.read(userPlaceProvider.notifier).addPlace(enteredTitle);
  Navigator.of(context).pop();
}
  @override 
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD NEW PLACES"),
      ),
      body:SingleChildScrollView(
      padding: EdgeInsets.all(12)
      ,child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title",
            ),
            controller:_titleController ,
            style: TextStyle(color:Theme.of(context).colorScheme.onBackground,
          )),
          SizedBox(height: 16),
          ElevatedButton.icon(onPressed: _savePlace, 
          icon:Icon(Icons.add), 
          label: Text("ADD PLACE"))
        ],
        
      ),

      ),

    );
  }
}
