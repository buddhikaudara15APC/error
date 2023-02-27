import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great-Places',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow) 
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => const AddPlaceScreen()
        },
      ),
    );
  }
}