import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  final String name;
  final String id;
  final File image;
  final PlaceLocation location;

  Place({
    required this.name,
    required this.image,
    required this.location,
    String? providedId,
  }) : id = providedId ?? uuid.v4();
}
