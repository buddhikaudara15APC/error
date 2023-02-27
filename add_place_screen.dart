import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  static const routeName = 'add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  File? _pickedImage;
  final _titleController = TextEditingController();
  @override
  void initState() {
    setState(() {
      if (_pickedImage == null) {
    _pickedImage != null;
  }
    });
   
    super.initState();
  }

  void _selectImage(File pickedImage){
  // if (_titleController.text.isEmpty || _pickedImage == null ) {
  //   return;
  // }
  
  _pickedImage = pickedImage;
  print(_pickedImage);
  }

  void _savePlace(){
    
      
      Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController.text, _pickedImage!);
   
      print('wrong');
    
  
  Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Place'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                   TextField(
                   decoration: const InputDecoration(labelText: 'Title'),
                   controller: _titleController,
                   ),
                   const SizedBox(height: 10,),
                   ImageInput(_selectImage)
                  ],
                ),
              ),
            ),
            ),
          ElevatedButton.icon(
            onPressed: _savePlace, 
            icon: const Icon(Icons.add), 
            label: const Text('Add Place'),
            ),
        ],
      ) ,
    );
  }
}