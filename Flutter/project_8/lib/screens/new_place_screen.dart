import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:project_8/models/place.dart';
import 'package:project_8/providers/places_list_provider.dart';
import 'package:project_8/widgets/image_input.dart';
import 'package:project_8/widgets/location_input.dart';

final _formkey = GlobalKey<FormState>();

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewPlaceScreen();
  }
}

class _NewPlaceScreen extends ConsumerState<NewPlaceScreen> {
  late TextEditingController _newPlaceName;
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _newPlaceName = TextEditingController();
  }

  @override
  void dispose() {
    _newPlaceName.dispose();
    super.dispose();
  }

  void _savePlace() {
    if (_selectedImage == null || _selectedLocation == null){
      return;
    }
    if (_formkey.currentState!.validate()) {
      ref.read(placesListProvider.notifier).addPlace(
            Place(
              name: _newPlaceName.text,
              image: _selectedImage!,
              location: _selectedLocation!,
            ),
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _newPlaceName,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                  validator: (value) {
                    // not available in TextField
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ImageInput(
                  onPickImage: (image) {
                    _selectedImage = image;
                  },
                ),
                const SizedBox(height: 16),
                LocationInput(
                  onSelectLocation: (location) {
                    _selectedLocation = location;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _savePlace,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
