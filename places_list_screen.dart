import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            }, 
            icon: const Icon(Icons.add)
            ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:const Center(child: Text('Got to no image yet? start adding something')),
        builder: (context, greatPlaces, ch) =>
        greatPlaces.items.isEmpty ? ch as Widget:
        ListView.builder( 
          itemBuilder: (c, i) =>ListTile(
            leading: CircleAvatar(
            backgroundImage:FileImage(greatPlaces.items[i].image as File),
            ),
            title: Text(greatPlaces.items[i].title),
          ),
          itemCount: Provider.of<GreatPlaces>(context).items.length,
          ),
          ),
    );
  }
}