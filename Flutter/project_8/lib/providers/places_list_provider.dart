import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:project_8/data/places.dart';
import 'package:project_8/models/place.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, name TEXT, image TEXT, lat REAL, lng REAL, address TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class PlaceListNotifier extends StateNotifier<List<Place>> {
  PlaceListNotifier() : super(places);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    state = data.map(
      (row) {
        return Place(
          providedId: row['id'] as String,
          name: row['name'] as String,
          image: File(row['image'] as String),
          location: PlaceLocation(
            latitude: row['lat'] as double,
            longitude: row['lng'] as double,
            address: row['address'] as String,
          ),
        );
      },
    ).toList();
  }

  void addPlace(Place newPlace) async {
    File image = newPlace.image;
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);

    File copiedImage = await image.copy('${appDir.path}/$filename');

    Place localNewPlace = Place(
        name: newPlace.name, image: copiedImage, location: newPlace.location);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': localNewPlace.id,
      'name': localNewPlace.name,
      'image': localNewPlace.image.path,
      'lat': localNewPlace.location.latitude,
      'lng': localNewPlace.location.longitude,
      'address': localNewPlace.location.address,
    }).then((value) {
      if (value != 0) {
        state = [localNewPlace, ...state];
      } else {
        return; // not inserted
      }
    });
  }

  Future<bool> removePlace(Place toBeRemoved) async {
    final db = await _getDatabase();
    db.delete(
      'user_places',
      where: 'id = ?',
      whereArgs: [toBeRemoved.id],
    ).then((value) {
      loadPlaces();
    });
    return true;
  }
}

final placesListProvider =
    StateNotifierProvider<PlaceListNotifier, List<Place>>(
        (ref) => PlaceListNotifier());
