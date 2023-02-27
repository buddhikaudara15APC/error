import 'dart:io';
import 'package:flutter/material.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier{

  final List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  void addPlace(String pickedTitle,File pickedImage){
  final newPlace = Place(
    id: DateTime.now().toString(), 
    image: pickedImage.toString(), 
    location: PlaceLocation(address: '', latitude: 0, longitude: 0), 
    title: pickedTitle
    );
    _items.add(newPlace);
    notifyListeners();
    print(newPlace);
  }

}