
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:project_8/models/place.dart';
import 'package:project_8/screens/map_screen.dart';


class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen({required this.place, super.key});

  final apiKey = dotenv.env['GOOGLE_API_KEY'];

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;

    return """https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng
&zoom=17&size=600x300
&maptype=terrain
&markers=color:green%7Clabel:A%7C$lat,$lng
&key=$apiKey""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            place.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  // Circular avatar map
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => MapScreen(location: place.location,isSelecting: false,),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(locationImage),
                      ),
                    ),
                  ),


                  const SizedBox(height: 18,),
                  
                  // Address                  
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient:  LinearGradient(
                        colors: [
                          Color.fromARGB(189, 0, 0, 0),
                          Colors.black54,
                        ],
                        begin: Alignment.center,
                        end: Alignment.topCenter,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      place.location.address,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}
