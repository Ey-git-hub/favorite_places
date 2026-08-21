import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});
  
  @override
  State<ImageInput> createState() => _ImageInputState();
}
class _ImageInputState extends State<ImageInput> {
  void _takePicture() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: _takePicture,
        icon: Icon(Icons.camera),
        label: Text("Take Picture"),
      ),
    );
  }
}