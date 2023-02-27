import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as syspath;


class ImageInput extends StatefulWidget {

final Function onSelectImage;
const ImageInput(this.onSelectImage,{super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {


   File? _storedImage;

 
  Future<void> _takePicture()async{
  final ImagePicker picker = ImagePicker();
  final imageFile = await picker.pickImage(source: ImageSource.camera,maxWidth: 600);
  setState(() {
      if (imageFile != null) {
        _storedImage = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  final appDir = await syspath.getApplicationDocumentsDirectory();
  final fileName = path.basename(imageFile!.path);
  final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
  widget.onSelectImage(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
          ),
          child: _storedImage != null?
          Image.file(_storedImage as File,fit: BoxFit.cover,width: double.infinity,)
          :const Center(child: Text(' No Image Taken')),
        ),
        const SizedBox(width: 10,),
        TextButton.icon(
          onPressed: _takePicture, 
          icon: const Icon(Icons.camera), 
          label: const Text('Take picture',style: TextStyle(color: Colors.purple),),
          
          ),
      ],
    );
  }
}